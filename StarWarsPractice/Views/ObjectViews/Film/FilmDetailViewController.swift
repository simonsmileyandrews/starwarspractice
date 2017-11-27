//
//  FilmDetailViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

  var filmModel: FilmDetailViewModel!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var producerLabel: UILabel!
  @IBOutlet weak var directorLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var crawlTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    titleLabel.text = filmModel.titleText
    producerLabel.text = filmModel.producerText
    directorLabel.text = filmModel.directorText
    dateLabel.text = filmModel.dateString
    
    crawlTextView.text = filmModel.openingCrawlText
    crawlTextView .setContentOffset(CGPoint(x: 0, y: -100), animated: false)
  }

// Film description autoscroll like in films
//  @objc func autoscrollFired() {
//
//    var scrollPoint = crawlTextView.contentOffset
//    scrollPoint = CGPoint(x: scrollPoint.x, y: scrollPoint.y + 2)
//    [crawlTextView .setContentOffset(scrollPoint, animated: true)]
//  }
}
