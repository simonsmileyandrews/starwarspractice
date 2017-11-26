//
//  FilmDetailViewModel.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class FilmDetailViewModel: NSObject {

  var film: Film!
  
  init(film: Film) {
    self.film = film
  }
  
  var primaryTitle: String? {
    return self.titleText! + " - Episode " + self.episodeText!
  }
  
  var secondaryTitle: String? {
    return self.directorText
  }
    
  var titleText: String? {
    return film?.title
  }
  
  var episodeText: String? {
    return String(describing: (film?.episode_id)!)
  }
  
  var episodeNumber: NSNumber? {
    return NSNumber(value: (film?.episode_id)!)
  }
  
  var openingCrawlText: String? {
    return film?.opening_crawl
  }
  
  var directorText: String? {
    return film?.director
  }
  
  var producerText: String? {
    return film?.producer
  }
  
  // Return the date of release as an NSNumber
  var releaseDateValue: NSNumber? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let date = dateFormatter.date(from: (film?.release_date)!)
    
    return NSNumber(value: (date?.timeIntervalSince1970)!)
  }
  
  var dateString: String? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let date = dateFormatter.date(from: (film?.release_date)!)
    
    //let stringDateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMM yyyy"
    let dateString = dateFormatter.string(from:date as! Date)
    
    return dateString
  }
}
