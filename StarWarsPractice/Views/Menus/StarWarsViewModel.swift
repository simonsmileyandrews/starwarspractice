//
//  StarWarsViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class StarWarsViewModel: NSObject {
  
  func getOptionsVCWithDelegateForType(type: String) -> Any {
    
    if type == "Films" {
      return FilmMenuViewModel()
    }
    else { //if type == "People" {
      // Add more security here so we can return nil if we don't have the object type
      return PersonMenuViewModel()
    }
  }
}
