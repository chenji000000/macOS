//
//  PerformanceTests.swift
//  High RollerTests
//
//  Created by 陈吉 on 2018/9/9.
//  Copyright © 2018年 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class PerformanceTests: XCTestCase {

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
  
  func testPerformanceTotalForDice_FlatMap_Reduce() {
    var roll = Roll()
    roll.changeNumberOfDice(newDiceCount: 20)
    roll.rollAll()
    
    self.measure {
      for _ in 0 ..< 10_000 {
        _ = roll.totalForDice()
      }
    }
  }
  
  func testPerformanceTotalForDice2_Filter_Reduce() {
    var roll = Roll()
    roll.changeNumberOfDice(newDiceCount: 20)
    roll.rollAll()
    
    self.measure {
      for _ in 0 ..< 10_000 {
        _ = roll.totalForDice2()
      }
    }
  }
  
  func testPerformanceTotalForDice3_Reduce() {
    var roll = Roll()
    roll.changeNumberOfDice(newDiceCount: 20)
    roll.rollAll()
    
    self.measure {
      for _ in 0 ..< 10_000 {
        _ = roll.totalForDice3()
      }
    }
  }
  
  func testPerformanceTotalForDice4_Old_Style() {
    var roll = Roll()
    roll.changeNumberOfDice(newDiceCount: 20)
    roll.rollAll()
    
    self.measure {
      for _ in 0 ..< 10_000 {
        _ = roll.totalForDice4()
      }
    }
  }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
