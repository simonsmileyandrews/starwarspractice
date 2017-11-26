//
//  PersonDetailViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 24/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var personModel: PersonDetailViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }

  // We have a single piece of data for each row of the detail
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    
    cell?.textLabel?.text = personModel.stringForIndex(index: indexPath.row)
    
    return cell!
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return personModel.numberOfRowsInDetailView!
  }
  
}
