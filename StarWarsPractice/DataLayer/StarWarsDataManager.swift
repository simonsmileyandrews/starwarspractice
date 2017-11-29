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
  case people
  case planet
  case film
  case species
  case vehicle
  case starship
}

class StarWarsDataManager: NSObject {
  
  static let sharedInstance = StarWarsDataManager()
  private override init() {
    // This prevents others from using the default '()' initializer for this class.
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
  
  func getJsonFromURL(url: URL, completionHandler: @escaping (NSDictionary) -> ()) {
    
    Alamofire.request(url).responseJSON { response in
      let json = response.result.value as! NSDictionary
      completionHandler(json)
    }
  }
  
  func getObjectsWithTypeAndInfo(type: starWarsType, info: NSArray) -> NSArray {
    
    // Loop through the objects, add them to an array, return them
    var models: [Any] = []
    
    for dict in info {
    
      switch type {
      case .people:
        models.append(Person(info: dict as! NSDictionary))
//    case .planet:
      case .film:
        models.append(Film(info: dict as! NSDictionary))
//    case .species:
//    case .vehicle:
//    case .starship:
      default :
        print("")
      }
    }
    
    return models as NSArray
  }
  
  func getUrlForType(type: starWarsType) -> String {
    
    switch type {
    case .people  :
      return "https://swapi.co/api/people/"
    case .planet  :
      return "https://swapi.co/api/planets/"
    case .film  :
      return "https://swapi.co/api/films/"
    case .species  :
      return "https://swapi.co/api/species/"
    case .vehicle  :
      return "https://swapi.co/api/vehicles/"
    case .starship  :
      return "https://swapi.co/api/starships/"
    }
  }
}
