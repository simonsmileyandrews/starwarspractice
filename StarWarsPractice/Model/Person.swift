//
//  Person.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import UIKit

struct Person {
  var name: String?
  var height: String?
  var mass: String?
  var hair_color: String?
  var skin_color: String?
  var eye_color: String?
  var birth_year: String?
  var gender: String?
  
  var type: starWarsType?
  
  init(info: NSDictionary) {
    
    self.name = info.value(forKey: "name") as? String
    self.height = info.value(forKey: "height") as? String
    self.mass = info.value(forKey: "mass") as? String
    self.hair_color = info.value(forKey: "hair_color") as? String
    self.skin_color = info.value(forKey: "skin_color") as? String
    self.eye_color = info.value(forKey: "eye_color") as? String
    self.birth_year = info.value(forKey: "birth_year") as? String
    self.gender = info.value(forKey: "gender") as? String
    
    self.type = .people
  }
}


//{
//  "name": "Luke Skywalker",
//  "height": "172",
//  "mass": "77",
//  "hair_color": "blond",
//  "skin_color": "fair",
//  "eye_color": "blue",
//  "birth_year": "19BBY",
//  "gender": "male",
//  "homeworld": "https://swapi.co/api/planets/1/",
//  "films": [
//  "https://swapi.co/api/films/2/",
//  "https://swapi.co/api/films/6/",
//  "https://swapi.co/api/films/3/",
//  "https://swapi.co/api/films/1/",
//  "https://swapi.co/api/films/7/"
//  ],
//  "species": [
//  "https://swapi.co/api/species/1/"
//  ],
//  "vehicles": [
//  "https://swapi.co/api/vehicles/14/",
//  "https://swapi.co/api/vehicles/30/"
//  ],
//  "starships": [
//  "https://swapi.co/api/starships/12/",
//  "https://swapi.co/api/starships/22/"
//  ],
//  "created": "2014-12-09T13:50:51.644000Z",
//  "edited": "2014-12-20T21:17:56.891000Z",
//  "url": "https://swapi.co/api/people/1/"
//},

