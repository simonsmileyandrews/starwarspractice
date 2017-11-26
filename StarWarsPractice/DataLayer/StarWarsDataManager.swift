//
//  StarWarsDataManager.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit
import Alamofire

enum starWarsType {
  case starWarsTypePeople
  case starWarsTypePlanets
  case starWarsTypeFilms
  case starWarsTypeSpecies
  case starWarsTypeVehicles
  case starWarsTypeStarships
}

class StarWarsDataManager: NSObject {
  
  class var sharedInstance: StarWarsDataManager {
    struct singleton {
      static let instance = StarWarsDataManager()
    }
    return singleton.instance
  }
  
  func getObjectsWithType(type: starWarsType, completionHandler: @escaping (NSArray) -> ()) {
    
    let starWarsUrl = URL(string: self.getUrlForType(type: type))
    
    Alamofire.request(starWarsUrl!).responseJSON { response in
      let json = response.result.value as! NSDictionary
      
      // Convert from JSON to an array of dictionaries
      var array = json["results"] as! NSArray
      array = self.getObjectsWithTypeAndInfo(type: type, info: array)
      
      completionHandler(array)
    }
  }
  
  public func getJsonFromURL(url: URL, completionHandler: @escaping (NSDictionary) -> ()) {
    
    Alamofire.request(url).responseJSON { response in
      let json = response.result.value as! NSDictionary
      completionHandler(json)
    }
  }
  
  func getObjectsWithTypeAndInfo(type: starWarsType, info: NSArray) -> NSArray {
    
    // Loop through the objects, add them to an array, return them
    var models: [Any] = []
    
    for dict in info {
    
      var model = NSObject()
      
      switch type {
      case .starWarsTypePeople  :
        model = Person(info: dict as! NSDictionary)
//    case .starWarsTypePlanets  :
      case .starWarsTypeFilms  :
        model = Film(info: dict as! NSDictionary)
//    case .starWarsTypeSpecies  :
//    case .starWarsTypeVehicles  :
//    case .starWarsTypeStarships  :
      default :
        print("")
      }
      
      models.append(model)
    }
    
    return models as NSArray
  }
  
  func getUrlForType(type: starWarsType) -> String {
    
    switch type {
    case .starWarsTypePeople  :
      return "https://swapi.co/api/people/"
    case .starWarsTypePlanets  :
      return "https://swapi.co/api/planets/"
    case .starWarsTypeFilms  :
      return "https://swapi.co/api/films/"
    case .starWarsTypeSpecies  :
      return "https://swapi.co/api/species/"
    case .starWarsTypeVehicles  :
      return "https://swapi.co/api/vehicles/"
    case .starWarsTypeStarships  :
      return "https://swapi.co/api/starships/"
    }
  }
  
  // We want a delegate method which will refresh the tableView
}
