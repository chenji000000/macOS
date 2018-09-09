//
//  ViewControllerTests.swift
//  High RollerTests
//
//  Created by 陈吉 on 2018/9/8.
//  Copyright © 2018年 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class ViewControllerTests: XCTestCase {

  // 1
  var vc: ViewController!
  
  override func setUp() {
    super.setUp()
    
    // 2
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    vc = storyboard.instantiateController(withIdentifier: "ViewController") as! ViewController
    
    // 3
    _ = vc.view
  }
  
  func testViewControllerIsCreated() {
    XCTAssertNotNil(vc)
  }
  
  func testControlsHaveDefaultData() {
    XCTAssertEqual(vc.numberOfDiceTextField.stringValue, String(2))
    XCTAssertEqual(vc.numberOfDiceStepper.integerValue, 2)
    XCTAssertEqual(vc.numberOfSidesPopup.titleOfSelectedItem, String(6))
  }
  
  func testChangingTextFieldChangesStepper() {
    vc.numberOfDiceTextField.stringValue = String(4)
    vc.numberOfDiceTextFieldChanged(vc.numberOfDiceTextField)
    
    XCTAssertEqual(vc.numberOfDiceTextField.stringValue, String(4))
    XCTAssertEqual(vc.numberOfDiceStepper.integerValue, 4)
  }
  
  func testChangingStepperChangesTextField() {
    vc.numberOfDiceStepper.integerValue = 10
    vc.numberOfDiceStepperChanged(vc.numberOfDiceStepper)
    
    XCTAssertEqual(vc.numberOfDiceTextField.stringValue, String(10))
    XCTAssertEqual(vc.numberOfDiceStepper.integerValue, 10)
  }
  
  func testViewControllerHasRollObject() {
    XCTAssertNotNil(vc.roll)
  }
  
  func testRollHasDefaultSettings() {
    XCTAssertEqual(vc.roll.numberOfSides, 6)
    XCTAssertEqual(vc.roll.dice.count, 2)
  }
  
  func testChangingNumberOfDiceInTextFieldChangesRoll() {
    vc.numberOfDiceTextField.stringValue = String(4)
    vc.numberOfDiceTextFieldChanged(vc.numberOfDiceTextField)
    
    XCTAssertEqual(vc.roll.dice.count, 4)
  }
  
  func testChangingNumberOfDiceInStepperChangesRoll() {
    vc.numberOfDiceStepper.integerValue = 10
    vc.numberOfDiceStepperChanged(vc.numberOfDiceStepper)
    
    XCTAssertEqual(vc.roll.dice.count, 10)
  }
  
  func testChangingNumberOfSidesPopupChangesRoll() {
    vc.numberOfSidesPopup.selectItem(withTitle: "20")
    vc.numberOfSidesPopupChanged(vc.numberOfSidesPopup)
    
    XCTAssertEqual(vc.roll.numberOfSides, 20)
  }
  
  func testDisplayIsBlankAtStart() {
    XCTAssertEqual(vc.resultsTextView.string, "")
    XCTAssertEqual(vc.resultsStackView.views.count, 0)
  }
  
  func testDisplayIsFilledInAfterRoll() {
    vc.rollButtonClicked(vc.rollButton)
    
    XCTAssertNotEqual(vc.resultsTextView.string, "")
    XCTAssertEqual(vc.resultsStackView.views.count, 2)
  }
  
  func testTextResultDisplayIsCorrect() {
    let testRolls = [1, 2, 3, 4, 5, 6]
    vc.displayDiceFromRoll(diceRolls: testRolls)
    
    var expectedText = "Total rolled: 21\n"
    expectedText += "Dice rolled: 1, 2, 3, 4, 5, 6 (6 x 6 sided dice)\n"
    expectedText += "You rolled: 1 x 1s,  1 x 2s,  1 x 3s,  1 x 4s,  1 x 5s,  1 x 6s"
    
    XCTAssertEqual(vc.resultsTextView.string, expectedText)
  }
  
  func testGraphicalResultDisplayIsCorrect() {
    let testRolls = [1, 2, 3, 4, 5, 6]
    vc.displayDiceFromRoll(diceRolls: testRolls)
    
    let diceEmojis = ["\u{2680}", "\u{2681}", "\u{2682}", "\u{2683}", "\u{2684}", "\u{2685}" ]
    
    XCTAssertEqual(vc.resultsStackView.views.count, 6)
    
    for (index, diceView) in vc.resultsStackView.views.enumerated() {
      guard let diceView = diceView as? NSTextField else {
        XCTFail("View \(index) is not NSTextField")
        return
      }
      let diceViewContent = diceView.stringValue
      XCTAssertEqual(diceViewContent, diceEmojis[index], "View \(index) is not showing the correct emoji.")
    }
  }

}
