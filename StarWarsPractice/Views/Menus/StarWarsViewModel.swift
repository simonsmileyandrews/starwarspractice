//
//  StarWarsViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

protocol optionsViewDelegate: class {
  func refreshView()
}

class StarWarsViewModel: NSObject {

  weak var delegate: optionsViewDelegate?
  var models = NSArray()
  
  func getObjectModelForIndex(index: Int) -> ObjectModel {
    
    if index == 0 {
      return FilmMenuViewModel()
    }
    else {
      return PersonMenuViewModel()
    }
  }
  
  func getOptionsVCWithDelegateForType(type: String) -> UIViewController {
    
    let vc = StarWarsOptionsViewController()
    
    if type == "Films" {
      vc.delegate = FilmMenuViewModel()
    }
    else if type == "People" {
      vc.delegate = PersonMenuViewModel()
    }
    
    return vc
  }
  
  func refreshData() {
    self.delegate?.refreshView()
  }
//
//  func getNumberOfRowsInSection(section: Int) -> Int {
//    return models.count
//  }
//  
//  func getNumberOfSections() -> Int {
//    return 1
//  }
//  
//  func getPrimaryText() -> String {
//    return "Primary"
//  }
//  
//  func getSecondaryText() -> String {
//    return "Secondary"
//  }
  
}
