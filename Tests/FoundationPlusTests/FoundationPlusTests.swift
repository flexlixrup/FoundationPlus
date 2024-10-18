@testable import FoundationPlus
import Testing

@Suite("Array Test Suite")
struct ArrayTests {
	
	@Test("Test to get the second to last element")
	func getSecondToLastElementNotNil() {
		let array: [Int] = [1, 2, 3, 4, 5]
		#expect(array.secondToLast == 4)
	}
	
	@Test("Test to get the second to last element when the array has < 2 elements")
	func getSecondToLastElementNil() {
		let array: [Int] = [1]
		#expect(array.secondToLast == nil)
	}
}

@Suite("CaseIterable Test Suite")
struct CaseIterableTests {
	
	@Test("Test to get the index of an element")
	func getIndexOfElement() {
		enum Direction: CaseIterable, Equatable {
			case north, south, east, west
		}
		let direction: Direction = .east
		#expect(direction.index == 2)
	}
}

@Suite("String test suite")
struct StringTests {
	
	@Test("Test the detection of Date Formats", arguments: [
		("12.12.2023", "dd.MM.yyyy"),
		("12.12.23", "dd.MM.yy"),
		("12/12/2023", "MM/dd/yyyy"),
		("2023-02-25 09:09:25", "yyyy-MM-dd HH:mm:ss"),
		("2023/12/12", "yyyy/MM/dd")
	])
	func testDateFormatDetector(values: (String, String)) {
		let result = values.0.dateFormat
		#expect(result == values.1)
	}
	
	@Test("Test the subscript for strings")
	func testSubscript() {
		let string: String = "Hello World"
		#expect(string[0] == "H")
		#expect(string[10] == "d")
		#expect(string[11] == nil)
	}
}
