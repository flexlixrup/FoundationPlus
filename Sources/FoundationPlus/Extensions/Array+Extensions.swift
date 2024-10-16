// The Swift Programming Language
// https://docs.swift.org/swift-book

public extension Array {
	/// The second to last element of the collection.
	@inlinable var secondToLast: Element? {
		guard count >= 2 else {
			return nil
		}
		return self[count - 2]
	}
}
