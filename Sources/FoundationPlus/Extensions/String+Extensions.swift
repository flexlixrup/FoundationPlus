//
//  String+Extensions.swift
//  FoundationPlus
//
//  Created by Felix Ruppert on 13.10.24.
//
import Foundation

public extension String {
	/// Finds the date format in a given String and returns it as String.
	///
	/// This method supports following date formats:
	/// - MM/dd/yyyy
	/// - yyyy-MM-dd
	/// - dd-MM-yyyy
	/// - dd.MM.yy
	/// - yyyy/MM/dd
	/// - yyyy-MM-dd'T'HH:mm:ssZ
	/// - yyyy-MM-dd HH:mm:ss
	/// - yyyy-MM-dd'T'HH:mm:ssXXXXX
	@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
	@inlinable var dateFormat: String {
		let regexes: [(Regex<(Substring, Substring)>, String)] = [
			// MM/dd/yyyy e.g., 01/31/2020
			(/(\d{2}\/\d{2}\/\d{4}$)/, "MM/dd/yyyy"),
			// yyyy-MM-dd e.g., 2020-01-31 (ISO 8601 Date)
			(/(\d{4}-\d{2}-\d{2}$)/, "yyyy-MM-dd"),
			// dd-MM-yyyy e.g., 31-01-2020
			(/(\d{2}-\d{2}-\d{4}$)/, "dd-MM-yyyy"),
			// dd.MM.yyyy e.g., 31.01.2020
			(/(\d{2}\.\d{2}\.\d{4}$)/, "dd.MM.yyyy"),
			// dd.MM.yy e.g., 31.01.20
			(/(\d{2}\.\d{2}\.\d{2}$)/, "dd.MM.yy"),
			// yyyy/MM/dd e.g., 2020/01/31
			(/(\d{4}\/\d{2}\/\d{2}$)/, "yyyy/MM/dd"),
			// ISO 8601 Date and Time e.g., 2020-01-31T15:20:30Z
			(/(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}\:\d{2}Z?$)/, "yyyy-MM-dd'T'HH:mm:ssZ"),
			(/(\d{4}-\d{2}-\d{2} \d{2}:\d{2}\:\d{2}?$)/, "yyyy-MM-dd HH:mm:ss"),
			// ISO 8601 Date and Time with Timezone e.g., 2020-01-31T15:20:30+00:00
			(/(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[\+\-]\\d{2}:\d{2}$)/, "yyyy-MM-dd'T'HH:mm:ssXXXXX")
		] // Date contains 2 dots
		for regex in regexes {
			if contains(regex.0) {
				return regex.1
			}
		}	
		return "dd.MM.yyyy"
	}
}

public extension String {
	/// Calculate the levenshtein distance between `self` and another String.
	/// - Parameter s2: The other string to compare `self` to.
	/// - Returns: The levenshtein distance.
	@inlinable
	func levenshteinDistance(to s2: String) -> Int {
		let s1: [UnicodeScalar] = Array(unicodeScalars)
		let s2: [UnicodeScalar] = Array(s2.unicodeScalars)
		
		guard !s1.isEmpty else { return s2.count }
		guard !s2.isEmpty else { return s1.count }
		
		var previousRow = Array(0...s2.count)
		
		for i in 1...s1.count {
			var currentRow = [i] + Array(repeating: 0, count: s2.count)
			
			for j in 1...s2.count {
				let insertion = currentRow[j - 1] + 1
				let deletion = previousRow[j] + 1
				let substitution = previousRow[j - 1] + (s1[i - 1] == s2[j - 1] ? 0 : 1)
				currentRow[j] = Swift.min(insertion, deletion, substitution)
			}
			
			previousRow = currentRow
		}
		return previousRow[s2.count]
	}

}
