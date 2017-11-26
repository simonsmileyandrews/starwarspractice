//
//  ObjectModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 24/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class ObjectModel: NSObject {
  
  weak var delegate: optionsViewDelegate?
  
  func refreshData() {
  }
  
  func getPrimaryTextWithIndex(index: Int) -> String {
      return ""
  }
  
  func getSecondaryTextWithIndex(index: Int) -> String {
    return ""
  }
  
  func getNumberOfRowsInSection(section: Int) -> Int {
    return 0
  }
  
  func getNumberOfSections() -> Int {
    return 0
  }
  
  var loadingString: String? {
    return ""
  }
  
  func getObjects(completionHandler: @escaping (NSArray) -> ()) {
    
  }
  
  func getViewControllerForIndex(index: Int) -> UIViewController {
    return UIViewController()
  }
  
  //return viewModel.getNumberOfRowsInSection(section: section)
  
}
