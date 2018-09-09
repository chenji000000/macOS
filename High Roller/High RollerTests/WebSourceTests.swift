//
//  WebSourceTests.swift
//  High RollerTests
//
//  Created by 陈吉 on 2018/9/9.
//  Copyright © 2018年 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class WebSourceTests: XCTestCase {

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
  
  func testDownloadingPageUsingExpectation() {
    // 1
    let expect = expectation(description: "waitForWebSource")
    var diceRollsReceived = 0
    
    let webSource = WebSource()
    webSource.findRollOnline(numberOfDice: 2) { (result) in
      diceRollsReceived = result.count
      // 2
      expect.fulfill()
    }
    
    // 3
    waitForExpectations(timeout: 10, handler: nil)
    XCTAssertEqual(diceRollsReceived, 2)
  }
  
  func testUsingMockURLSession() {
    // 1
    let address = "https://www.random.org/dice/?num=2"
    guard let url = URL(string: address) else {
      XCTFail()
      return
    }
    let request = URLRequest(url: url)
    
    // 2
    let mockSession = MockURLSession()
    XCTAssertFalse(mockSession.dataTask.resumeGotCalled)
    XCTAssertNil(mockSession.url)
    
    // 3
    let task = mockSession.dataTask(with: request) { (data, response, error) in }
    task.resume()
    
    // 4
    XCTAssertTrue(mockSession.dataTask.resumeGotCalled)
    XCTAssertEqual(mockSession.url, url)
  }
  
  func testParsingGoodData() {
    let webSource = WebSource()
    let goodDataString = "<p>You rolled 2 dice:</p>\n<p>\n<img src=\"dice6.png\" alt=\"6\" />\n<img src=\"dice1.png\" alt=\"1\" />\n</p>"
    guard let goodData = goodDataString.data(using: .utf8) else {
      XCTFail()
      return
    }
    
    let diceArray = webSource.parseIncomingData(data: goodData)
    XCTAssertEqual(diceArray, [6, 1])
  }
  
  func testParsingBadData() {
    let webSource = WebSource()
    let badDataString = "This string is not the expected result"
    guard let badData = badDataString.data(using: .utf8) else {
      XCTFail()
      return
    }
    
    let diceArray = webSource.parseIncomingData(data: badData)
    XCTAssertEqual(diceArray, [])
  }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  

}

class MockURLSession: URLSession {
  var url: URL?
  var dataTask = MockURLSessionTask()
  
  override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> MockURLSessionTask {
    self.url = request.url
    return dataTask
  }
}

class MockURLSessionTask: URLSessionDataTask {
  var resumeGotCalled = false
  
  override func resume() {
    resumeGotCalled = true
  }
}
