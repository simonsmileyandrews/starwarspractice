//
//  PersonMenuViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class PersonMenuViewModel: ObjectModel, optionsMenuDelegate {

  //weak var delegate: optionsViewDelegate?
  var personModels = [PersonDetailViewModel]()
  
  var numberOfSections: Int = 0
  var rowsPerSection: [Int] = [0]
  
  override func refreshData() {
    
    StarWarsDataManager.sharedInstance.getObjectsWithType(type: .starWarsTypePeople) { (people) in
      
      self.personModels = [PersonDetailViewModel]()
      
      for person in people {
        let cellModel = PersonDetailViewModel(person: person as! Person)
        self.personModels.append(cellModel)
      }
      
      self.sortModels()
      
      self.rowsPerSection = [people.count]
      self.numberOfSections = 1
      
      self.delegate?.refreshView()
    }
  }
  
  func sortModels() {
    //cellViewModels = cellViewModels.sorted(by: {$0.releaseDateValue!.intValue < $1.releaseDateValue!.intValue})
  }
  
  override var loadingString: String? {
    return "Loading People..."
  }
  
  func viewModelForCell(index: Int) -> PersonDetailViewModel {
    return personModels[index]
  }
  
  override func getPrimaryTextWithIndex(index: Int) -> String {
    let detailModel = self.viewModelForCell(index: index)
    return detailModel.primaryTitle!
  }
  
  override func getSecondaryTextWithIndex(index: Int) -> String {
    let detailModel = self.viewModelForCell(index: index)
    return detailModel.secondaryTitle!
  }
  
  override func getNumberOfRowsInSection(section: Int) -> Int {
    return rowsPerSection[section]
  }
  
  override func getNumberOfSections() -> Int {
    return numberOfSections
  }
  
  override func getViewControllerForIndex(index: Int) -> UIViewController {
    let vc = PersonDetailViewController()
    vc.personModel = self.viewModelForCell(index: index)
    return vc
  }
}
