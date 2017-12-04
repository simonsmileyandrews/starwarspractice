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
  
  private var model = StarWarsViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell_identifier)
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: cell_identifier, for: indexPath)
    cell.textLabel?.text = model.getMenuTitle(index: indexPath.row)
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.getNumberOfRowsIn(section: section)
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = model.getVCWithType(type: model.getMenuTitle(index: indexPath.row))
    
    self.navigationController?.pushViewController(vc, animated: true)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
