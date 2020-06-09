import XCTest
import WordPress

class ArrayTests: XCTestCase {
    func testRepeatLast() {
        let array = [1, 2, 3]
        let repeated = Array(array.repeatingLast().prefix(5))
        let expected = [1, 2, 3, 3, 3]
        XCTAssertEqual(expected, repeated)
    }

    func testRepeatLastWithEmptyArray() {
        let array = [Int]()
        let repeated = Array(array.repeatingLast().prefix(5))
        let expected = [Int]()
        XCTAssertEqual(expected, repeated)
    }

    func testDifferentIndicesReturnsEmptyWithSameArray() {
        let test = [1, 2, 3]
        let result = test.differentIndices(test)
        XCTAssert(result.isEmpty)
    }

    func testDifferentIndicesReturnsDifferencesWhenOtherSmaller() {
        let test = [1, 2, 3]
        let other = [1]
        let result = test.differentIndices(other)
        XCTAssertEqual(result, [1, 2])
    }

    func testDifferentIndicesReturnsDifferencesWhenOtherLarger() {
        let test = [1, 2, 3]
        let other = [1, 0, 3, 4]
        let result = test.differentIndices(other)
        XCTAssertEqual(result, [1])
    }

    func testUniqueRemovesDuplicates() {
        let test = ["🦄", "🦄", "🌈"]

        let result = test.unique

        XCTAssertTrue(result.count == 2 && result.contains("🦄") && result.contains("🌈"))
    }

}

class TestElement: Equatable {
    var key: String
    var value: Int

    init(key: String, value: Int) {
        self.key = key
        self.value = value
    }
}

func ==(lhs: TestElement, rhs: TestElement) -> Bool {
    return lhs.key == rhs.key && lhs.value == rhs.value
}
