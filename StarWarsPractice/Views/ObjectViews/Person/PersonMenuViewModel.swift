//
//  PersonMenuViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class PersonMenuViewModel: NSObject, OptionsMenuDelegate {

  //weak var delegate: optionsViewDelegate?
  var personModels = [PersonDetailViewModel]()
  
  var numberOfSections: Int = 0
  var rowsPerSection: [Int] = [0]
  
  func refreshData(completionHandler: @escaping (NSArray) -> ()) {
    
    StarWarsDataManager.sharedInstance.getObjectsWithType(type: .people) { (people) in
      
      self.personModels = [PersonDetailViewModel]()
      
      for person in people {
        let cellModel = PersonDetailViewModel(person: person as! Person)
        self.personModels.append(cellModel)
      }
      
      self.sortModels()
      
      self.rowsPerSection = [people.count]
      self.numberOfSections = 1
      
      completionHandler(people)
    }
  }
  
  func sortModels() {
    //cellViewModels = cellViewModels.sorted(by: {$0.releaseDateValue!.intValue < $1.releaseDateValue!.intValue})
  }
  
  func getLoadingString() -> String {
    return "Loading People..."
  }
  
  func viewModelForCell(index: Int) -> PersonDetailViewModel {
    return personModels[index]
  }
  
  func getPrimaryTextWith(index: Int) -> String {
    
    let count = personModels.count
    
    if count > 0 {
      let detailModel = self.viewModelForCell(index: index)
      return detailModel.primaryTitle!
    }
    return ""
  }
  
  func getSecondaryTextWith(index: Int) -> String {
    
    let count = personModels.count
    
    if count > 0 {
      let detailModel = self.viewModelForCell(index: index)
      return detailModel.secondaryTitle!
    }
    return ""
  }
  
  func getNumberOfRowsIn(section: Int) -> Int {
    return rowsPerSection[section]
  }
  
  func getNumberOfSections() -> Int {
    return numberOfSections
  }
  
  func getViewControllerWith(index: Int) -> UIViewController {
    let vc = PersonDetailViewController()
    vc.personModel = self.viewModelForCell(index: index)
    return vc
  }
}
