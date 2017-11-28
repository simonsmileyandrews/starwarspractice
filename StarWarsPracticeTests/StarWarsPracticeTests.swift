//
//  StarWarsPracticeTests.swift
//  StarWarsPracticeTests
//
//  Created by Simon Smiley-Andrews on 21/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import XCTest
@testable import StarWarsPractice

class StarWarsPracticeTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
      
    let storyboard = UIStoryboard(name: "StarWarsMenuViewController", bundle: Bundle.main)
    vc = storyboard.instantiateInitialViewController() as! StarWarsMenuViewController
    
    
  }
    
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
}
