//
//  FilmMenuViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class FilmMenuViewModel: ObjectModel, optionsMenuDelegate {
  
  //weak var delegate: optionsViewDelegate?
  var filmModels = [FilmDetailViewModel]()
  
  var numberOfSections: Int = 0
  var rowsPerSection: [Int] = [0]
  
  override func refreshData() {
    
    StarWarsDataManager.sharedInstance.getObjectsWithType(type: .starWarsTypeFilms) { (films) in
      
      self.filmModels = [FilmDetailViewModel]()
      
      for film in films {
        let filmModel = FilmDetailViewModel(film: film as! Film)
        self.filmModels.append(filmModel)
      }
      
      self.sortModels()
      
      self.rowsPerSection = [films.count]
      self.numberOfSections = 1
      
      self.delegate?.refreshView()
    }
  }
  
  func sortModels() {
    filmModels = filmModels.sorted(by: {$0.releaseDateValue!.intValue < $1.releaseDateValue!.intValue})
  }
  
  override var loadingString: String? {
    return "Loading Films..."
  }
  
  func viewModelForCell(index: Int) -> FilmDetailViewModel {
    return filmModels[index]
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
    let vc = FilmDetailViewController()
    vc.filmModel = self.viewModelForCell(index: index)
    return vc
  }
}

// Potential - write mu;ltiple view models - one for each screen we want to load

// View model has a dataasource and can switch it out
// Datasource confirms to a protocol

