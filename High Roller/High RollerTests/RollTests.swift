//
//  RollTests.swift
//  High RollerTests
//
//  Created by 陈吉 on 2018/9/7.
//  Copyright © 2018年 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class RollTests: XCTestCase {

  var roll: Roll!
  
  override func setUp() {
    super.setUp()
    
    roll = Roll()
    roll.changeNumberOfDice(newDiceCount: 5)
  }
  
  func testCreatingRollOfDice() {
    XCTAssertNotNil(roll)
    XCTAssertEqual(roll.dice.count, 5)
  }
  
  func testTotalForDiceBeforeRolling_ShouldBeZero() {
    let total = roll.totalForDice()
    XCTAssertEqual(total, 0)
  }
  
  func testTotalForDiceAfterRolling_ShouldBeBetween5And30() {
    roll.rollAll()
    let total = roll.totalForDice()
    XCTAssertGreaterThanOrEqual(total, 5)
    XCTAssertLessThanOrEqual(total, 30)
  }

}
