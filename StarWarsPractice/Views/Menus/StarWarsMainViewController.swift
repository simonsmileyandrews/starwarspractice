//
//  StarWarsMenuViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 21/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import UIKit
import Alamofire

class StarWarsMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
    
  private var starWarsData: NSArray!
  private var titles = ["Films", "Species", "Starships", "People", "Vehicles", "Planets"]
  private var data: NSDictionary!
  
  private var apiUrl: URL = URL.init(string: "https://swapi.co/api/")!
  
  private var model: StarWarsViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    starWarsData = NSArray()
    
    StarWarsDataManager.sharedInstance.getJsonFromURL(url: apiUrl) { (data) in
      self.data = data
      self.starWarsData = data.allKeys as NSArray
      self.tableView.reloadData()
    }
    
    model = StarWarsViewModel()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "bCell")
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "bCell", for: indexPath)
        
    cell.textLabel?.text = titles[indexPath.row]
        
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let delegate = model.getOptionsVCWithDelegateForType(type: titles[indexPath.row])
    
    let vc = StarWarsOptionsViewController()

    vc.delegate = delegate as? optionsMenuDelegate
    
    self.navigationController?.pushViewController(vc, animated: true)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

