import XCTest
@testable import DIM

final class InjectionTests: XCTestCase {
    override func setUp() {}

    override func tearDown() {}

    func testInjectionTypeInit() {
        struct Testing {}
        let test = Injection(Testing.self) { Testing() }
        XCTAssertEqual(String(describing: Testing.self), test.name)
        XCTAssertTrue(test.resolve() is Testing)
    }

    func testInjectionNameInit() {
        struct Testing {}
        let test = Injection("TestName") { Testing() }
        XCTAssertNotEqual(String(describing: Testing.self), test.name)
        XCTAssertEqual("TestName", test.name)
        XCTAssertTrue(test.resolve() is Testing)
    }
}
