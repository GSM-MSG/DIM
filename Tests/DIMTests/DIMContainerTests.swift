import XCTest
import DIM

final class DIMContainerTests: XCTestCase {
    func testDIMContainer() {
        DIMContainer {
            Injection(String.self) { "Hello" }
        }.build()
        XCTAssertEqual(DIMContainer.resolve(for: String.self), "Hello")
        XCTAssertEqual(DIMContainer.resolve(), "Hello")

        DIMContainer {
            Injection("Test") { "World" }
        }.build()
        XCTAssertEqual(DIMContainer.resolve(for: "Test"), "World")

        struct TestStruct: Equatable {}

        DIMContainer {
            Injection(TestStruct.self) { .init() }
        }.build()
        XCTAssertEqual(DIMContainer.resolve(for: TestStruct.self), TestStruct())

        let container = DIMContainer {
            Injection(String.self) { "Test" }
        }
        DIMContainer {
            container
        }.build()
        @Injected var inject: String
        XCTAssertEqual(inject, "Test")
    }
}
