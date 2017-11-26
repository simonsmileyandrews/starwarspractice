//
//  Film.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 22/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import UIKit

class Film: NSObject {
  var title: String?
  var episode_id: Int?
  var opening_crawl: String?
    
  var director: String?
  var producer: String?
  var release_date: String?
  
  //var characters: [People]
  //var planets: Planets?
  //var starships: Starships?
  //var vehicles: Vehicles?
  //var species: species?
    
  var url: NSURL?
  
  var type: starWarsType?
  
  init(info: NSDictionary) {
    
    self.title = info.value(forKey: "title") as? String
    self.episode_id = info.value(forKey: "episode_id") as? Int
    self.opening_crawl = info.value(forKey: "opening_crawl") as? String
    
    self.director = info.value(forKey: "director") as? String
    self.producer = info.value(forKey: "producer") as? String
    
    self.release_date = info.value(forKey: "release_date") as? String
    
    self.type = .starWarsTypeFilms
  }
}


//"title": "A New Hope",
//"episode_id": 4,
//"opening_crawl": "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....",
//"director": "George Lucas",
//"producer": "Gary Kurtz, Rick McCallum",
//"release_date": "1977-05-25",
//"characters": [
//"https://swapi.co/api/people/1/",
//"https://swapi.co/api/people/81/"
//],
//"planets": [
//"https://swapi.co/api/planets/2/",
//"https://swapi.co/api/planets/3/",
//"https://swapi.co/api/planets/1/"
//],
//"starships": [
//"https://swapi.co/api/starships/2/",
//"https://swapi.co/api/starships/3/",
//],
//"vehicles": [
//"https://swapi.co/api/vehicles/4/",
//"https://swapi.co/api/vehicles/6/",
//],
//"species": [
//"https://swapi.co/api/species/5/",
//"https://swapi.co/api/species/3/",
//],
//"created": "2014-12-10T14:23:31.880000Z",
//"edited": "2015-04-11T09:46:52.774897Z",
//"url": "https://swapi.co/api/films/1/"

