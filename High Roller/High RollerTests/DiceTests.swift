//
//  DiceTests.swift
//  High RollerTests
//
//  Created by 陈吉 on 2018/9/6.
//  Copyright © 2018年 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class DiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
  
    func testForDice() {
        let _ = Dice()
    }
  
  // 1
  func testValueForNewDiceIsNil() {
    let testDie = Dice()
    
    // 2
    XCTAssertNil(testDie.value, "Die value should be nil after init")
  }
  
  func testRollDie() {
    var testDie = Dice()
    testDie.rollDie()
    
    XCTAssertNotNil(testDie.value)
  }
  
  func testDiceRoll_ShouldBeFromOneToSix() {
    var testDie = Dice()
    testDie.rollDie()
    
    XCTAssertTrue(testDie.value! >= 1)
    XCTAssertTrue(testDie.value! <= 6)
    XCTAssertFalse(testDie.value == 0)
  }
  
  func testRollsAreSpreadRoughlyEvenly() {
    performMultipleRollTests()
  }
  
  func testRollingTwentySidedDice() {
    var testDie = Dice()
    testDie.rollDie(numberOfSides: 20)
    
    XCTAssertNotNil(testDie.value)
    XCTAssertTrue(testDie.value! >= 1)
    XCTAssertTrue(testDie.value! <= 20)
  }
  
  func testTwentySidedRollsAreSpreadRoughlyEvenly() {
    performMultipleRollTests(numberOfSides: 20)
  }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension DiceTests {
  
  fileprivate func performMultipleRollTests(numberOfSides: Int = 6, line: UInt = #line) {
    var testDie = Dice()
    var rolls: [Int: Double] = [:]
    let rollCounter = Double(numberOfSides) * 100.0
    let expectedResult = rollCounter / Double(numberOfSides)
    let allowedAccuracy = rollCounter / Double(numberOfSides) * 0.3
    
    for _ in 0 ..< Int(rollCounter) {
      testDie.rollDie(numberOfSides: numberOfSides)
      guard let newRoll = testDie.value else {
        XCTFail()
        return
      }
      
      if let existingCount = rolls[newRoll] {
        rolls[newRoll] = existingCount + 1
      } else {
        rolls[newRoll] = 1
      }
    }
    
    XCTAssertEqual(rolls.keys.count, numberOfSides, line: line)
    
    for (key, roll) in rolls {
      XCTAssertEqualWithAccuracy(roll,
                                 expectedResult,
                                 accuracy: allowedAccuracy,
                                 "Dice gave \(roll) x \(key)",
                                 line: line)
    }
  }
  
}
