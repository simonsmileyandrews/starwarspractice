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
    
//    if (starWarsData.count > 0) {
//      return starWarsData.count
//    }
//    else {
//      return 0
//    }
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
//    let vc = model.getOptionsVCWithDelegateForType(type: titles[indexPath.row])
//    self.navigationController?.pushViewController(vc, animated: true)
    
    // We want to push the correct view controller based on the menu here
//    var vc: UIViewController?
//
//    let title = titles[indexPath.row]
//
//    if title.range(of:"Films") != nil {
//      vc = FilmMenuViewController()
//    }
//    else if title.range(of:"People") != nil {
//      vc = PersonMenuViewController()
//    }
//
//    if let viewController = vc {
//      self.navigationController?.pushViewController(viewController, animated: true)
//    }
  
    
    // Segue to the OptionsViewController and set the delegate model in the options
    self.performSegue(withIdentifier: "optionsPushSegue", sender: self)
    
    
    
    tableView.deselectRow(at: indexPath, animated: true)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "optionsPushSegue" {
      
      if let indexPath = tableView.indexPathForSelectedRow {
        let selectedRow = indexPath.row
        
        let vc = segue.destination as! StarWarsOptionsViewController

        // We want to get the object model based on what was clicked
        vc.viewModel = model.getObjectModelForIndex(index: selectedRow)
        
        
        //let title = starWarsData[selectedRow] as! String

        // We want to set the view model here
        
        //if title.range(of:"films") != nil {

          //vc.type = .starWarsTypeFilms
          //let url = URL(string: data.object(forKey: "films") as! String)
          //model = FilmsViewModel.init(film: Film())
          //model = FilmsViewModel(URL: url!)
//        }
//        else if title.range(of:"people") != nil {
        
          //vc.type = .starWarsTypePeople
          //model = PersonDetailViewModel.init(person: Person())
//          let url = URL(string: data.object(forKey: "people") as! String)
//          model = PeopleViewModel(URL: url!)
//        }
      }
    }
  }
}

