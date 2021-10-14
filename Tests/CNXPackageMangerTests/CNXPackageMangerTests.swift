import XCTest
@testable import CNXPackageManger

final class CNXPackageMangerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CNXPackageManger().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
