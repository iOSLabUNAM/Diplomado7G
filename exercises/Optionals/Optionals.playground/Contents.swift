import Foundation
import XCTest

class OptionalsTests: XCTestCase {
    func testOptional() {
        var optionalInt: Int?
        var optionalStr: String?
        
        XCTAssertNil(optionalInt)
        XCTAssertNil(optionalStr)
    }
    
    func testAssignOptional() {
        let value: Int? = 42
        
        XCTAssertNotNil(value)
        // TODO: make it pass this test
        XCTAssertEqual(Int(42), value)
    }
    
    func testUnsafeUnwrap(){
        var value: Int?
        value = 42
        
        XCTAssertEqual(42, value!)
    }
    
    func testSafeUnwrapWithDefault() {
        var value: Int?
        value = 42
        
        XCTAssertEqual(42, value ?? 12)
        value = nil
        XCTAssertEqual(12, value ?? 12)
    }
    
    func testSafeUnwrapWithIf(){
        var value: Int?
        value = 42
        
        if let unwrapedValue = value {
            XCTAssertEqual(42, unwrapedValue)
        } else {
            XCTAssert(false, "Unexpected nil value")
        }
    }

    // Solve this exercise using guard clause for unwrapping optionals
    // func testGuardClauseExercise() {
    //     var value: Int?
    //     value = 42

    //     XCTAssertTrue(evaluateOptional(value: value))
    //     value = nil
    //     XCTAssertFalse(evaluateOptional(value: value))
    // }

    // func evaluateOptional(value: Int?) -> Bool {
    //     return false // TODO: replace with guard clause
    // }
}

OptionalsTests.defaultTestSuite.run()
