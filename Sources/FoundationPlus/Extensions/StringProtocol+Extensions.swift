//
//  StringProtocol+Extensions.swift
//  FoundationPlus
//
//  Created by Felix Ruppert on 24.10.24.
//

public extension StringProtocol {
	@inlinable subscript (index: Int) -> Character? {
		guard index >= 0, index < count else { return nil }
		let chars: [Character] = Array(self)
		return chars[index]
	}
}

