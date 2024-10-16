//
//  CaseIterable+Extensions.swift
//  FoundationPlus
//
//  Created by Felix Ruppert on 13.10.24.
//

public extension CaseIterable where Self: Equatable {
	/// Finds the index of an equatale case in a CaseIterable enum.
	@inlinable var index: Self.AllCases.Index {
		Self.allCases.firstIndex { self == $0 }!
	}
}
