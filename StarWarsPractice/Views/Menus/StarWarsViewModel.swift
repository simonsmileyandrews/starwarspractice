//
//  StarWarsViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class StarWarsViewModel: NSObject {
  
  // This should come from the view model
  private var titles = [film_path, species_path, starship_path, people_path, vehicle_path, planet_path]
  
  func getModelFor(type: String) -> Any {
    
    switch type.localizedLowercase {
    case film_path:
      return FilmMenuViewModel()
    default:
      // Add more security here so we can return nil if we don't have the object type
      return PersonMenuViewModel()
    }
  }
  
  func getVCWithType(type: String) -> UIViewController {
    
    let delegate = self.getModelFor(type: type)
    let vc = StarWarsOptionsViewController()
    vc.delegate = delegate as? OptionsMenuDelegate
    
    return vc
  }
  
  func getMenuTitle(index: Int) -> String {
    return titles[index].capitalizingFirstLetter()
  }
  
  func getNumberOfRowsIn(section: Int) -> Int {
    return titles.count
  }
  
  func getNumberOfSections() -> Int {
    return 1
  }
}

extension String {
  func capitalizingFirstLetter() -> String {
    return prefix(1).uppercased() + dropFirst()
  }
  
  mutating func capitalizeFirstLetter() {
    self = self.capitalizingFirstLetter()
  }
}
