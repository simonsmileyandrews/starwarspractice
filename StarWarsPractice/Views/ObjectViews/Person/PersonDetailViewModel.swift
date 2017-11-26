//
//  PersonDetailViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class PersonDetailViewModel: NSObject {

  private var person: Person?
  
  init(person: Person) {
    self.person = person
  }
  
  var primaryTitle: String? {
    return self.nameText
  }
  
  var secondaryTitle: String? {
    return person?.gender
  }
  
  var nameText: String? {
    return person?.name
  }
  
  var heightValue: Int? {
    return Int((person?.height)!)
  }
  
  var heightString: String? {
    return person?.height
  }
  
  var massValue: Int? {
    return Int((person?.mass)!)
  }
  
  var massString: String? {
    return person?.mass
  }
  
  var hairColorText: String? {
    return person?.hair_color
  }
  
  var genderText: String? {
    return person?.gender
  }
  
  func stringForIndex(index: Int) -> String {
  
    switch(index) {
    case 0:
      return "Name: " + self.nameText!
    case 1:
      return "Height: " + self.heightString! + "cm"
    case 2:
      return "Mass: " + self.massString! + "kg"
    case 3:
      return "Hair color: " + (person?.hair_color)!
    case 4:
      return "Skin color: " + (person?.skin_color)!
    case 5:
      return "Eye color: " + (person?.eye_color)!
    case 6:
      return "Birth year: " + (person?.birth_year)!
    case 7:
      return "Gender: " + (person?.gender)!
    default :
      return ""
    }
  }
  
  var numberOfRowsInDetailView: Int? {
    
    var count: NSInteger = 0
    let mirrored_object = Mirror(reflecting: person!)
    
    for (index, attr) in mirrored_object.children.enumerated() {
      if let property_name = attr.label as String! {
        
        count += 1
        print("Attr \(index): \(property_name) = \(attr.value)")
      }
    }
    
    return count
  }
}
