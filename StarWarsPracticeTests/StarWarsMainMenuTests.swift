//
//  StarWarsMainMenuTests.swift
//  StarWarsPracticeUITests
//
//  Created by Simon Smiley-Andrews on 27/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import XCTest

@testable import StarWarsPractice

class StarWarsMainMenuTests: XCTestCase {
  
  var titles:NSArray!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    titles = ["Films", "Species", "Starships", "People", "Vehicles", "Planets"]
    
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    
    titles = nil
  }
}
