//
//  TypedTextAttributesTests.swift
//  TypedTextAttributesTests
//
//  Created by muukii on 9/15/18.
//  Copyright © 2018 muukii. All rights reserved.
//

import XCTest

@testable import TypedTextAttributes

class TypedTextAttributesTests: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testExample() {
    let attr = TextAttributes()
      .font(UIFont.systemFont(ofSize: 13))
      .foregroundColor(.white)

    XCTAssertEqual(attr[.font] as! UIFont, UIFont.systemFont(ofSize: 13))
    XCTAssertEqual(attr[.foregroundColor] as! UIColor, UIColor.white)

  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      TextAttributes()
        .font(UIFont.preferredFont(forTextStyle: .headline))
        .foregroundColor(.white)
        .backgroundColor(.red)
        .alignment(.center)
    }
  }

}
