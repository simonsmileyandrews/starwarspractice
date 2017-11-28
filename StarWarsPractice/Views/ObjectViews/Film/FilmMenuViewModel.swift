//
//  FilmMenuViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit
import PromiseKit

class FilmMenuViewModel: NSObject, optionsMenuDelegate {
  
  var filmModels = [FilmDetailViewModel]()
  
  var numberOfSections: Int = 0
  var rowsPerSection: [Int] = [0]
  
  //func refreshDataPromise(completionHandler: @escaping (NSArray) -> ()) {
  func refreshData(completionHandler: @escaping (NSArray) -> ()) {
  
    weak var weakSelf = self
    
    StarWarsDataManager.sharedInstance.getObjects(type: .starWarsTypeFilms).then { films in
      
      weakSelf?.filmModels = [FilmDetailViewModel]()
      
      //
      //      for film in films {
      //        let filmModel = FilmDetailViewModel(film: film as! Film)
      //        self.filmModels.append(filmModel)
      //      }
      //
      //      self.sortModels()
      //
      //      self.rowsPerSection = [films.count]
      //      self.numberOfSections = 1
      //
      //      completionHandler(films)
      
      print("Hello World")
    }
  }
    
  
//  func refreshData(completionHandler: @escaping (NSArray) -> ()) {
//
//    StarWarsDataManager.sharedInstance.getObjectsWithType(type: .starWarsTypeFilms) { (films) in
//
//      self.filmModels = [FilmDetailViewModel]()
//
//      for film in films {
//        let filmModel = FilmDetailViewModel(film: film as! Film)
//        self.filmModels.append(filmModel)
//      }
//
//      self.sortModels()
//
//      self.rowsPerSection = [films.count]
//      self.numberOfSections = 1
//
//      completionHandler(films)
//    }
//  }

  func sortModels() {
    filmModels = filmModels.sorted(by: {$0.releaseDateValue!.intValue < $1.releaseDateValue!.intValue})
  }
  
  func getLoadingString() -> String {
    return "Loading Films..."
  }
  
  func viewModelForCell(index: Int) -> FilmDetailViewModel {
    return filmModels[index]
  }
  
  func getPrimaryTextWithIndex(index: Int) -> String {
    
    let count = filmModels.count
    
    if count > 0 {
      let detailModel = self.viewModelForCell(index: index)
      return detailModel.primaryTitle!
    }
    return ""
  }
  
  func getSecondaryTextWithIndex(index: Int) -> String {
    
    let count = filmModels.count
    
    if count > 0 {
      let detailModel = self.viewModelForCell(index: index)
      return detailModel.secondaryTitle!
    }
    return ""
  }
  
  func getNumberOfRowsInSection(section: Int) -> Int {
    return rowsPerSection[section]
  }
  
  func getNumberOfSections() -> Int {
    return numberOfSections
  }
  
  func getViewControllerForIndex(index: Int) -> UIViewController {
    let vc = FilmDetailViewController()
    vc.filmModel = self.viewModelForCell(index: index)
    return vc
  }
}

