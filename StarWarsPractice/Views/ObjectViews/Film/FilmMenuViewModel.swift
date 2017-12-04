//
//  FilmMenuViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class FilmMenuViewModel: NSObject, OptionsMenuDelegate {
  
  var filmModels = [FilmDetailViewModel]()
  
  var numberOfSections: Int = 0
  var rowsPerSection: [Int] = [0]
  
  func refreshData(completionHandler: @escaping (NSArray) -> ()) {
    
    StarWarsDataManager.sharedInstance.getObjectsWithType(type: .film) { (films) in
      
      self.filmModels = [FilmDetailViewModel]()
      
      for film in films {
        let filmModel = FilmDetailViewModel(film: film as! Film)
        self.filmModels.append(filmModel)
      }
      
      self.sortModels()
      
      self.rowsPerSection = [films.count]
      self.numberOfSections = 1
      
      completionHandler(films)
    }
  }
  
  func sortModels() {
    filmModels = filmModels.sorted(by: {$0.releaseDateValue!.intValue < $1.releaseDateValue!.intValue})
  }
  
  func getLoadingString() -> String {
    return "Loading Films..."
  }
  
  func viewModelForCell(index: Int) -> FilmDetailViewModel {
    return filmModels[index]
  }
  
  func getPrimaryTextWith(index: Int) -> String {
    
    let count = filmModels.count
    
    if count > 0 {
      let detailModel = self.viewModelForCell(index: index)
      return detailModel.primaryTitle!
    }
    return ""
  }
  
  func getSecondaryTextWith(index: Int) -> String {
    
    let count = filmModels.count
    
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
    let vc = FilmDetailViewController()
    vc.filmModel = self.viewModelForCell(index: index)
    return vc
  }
}

