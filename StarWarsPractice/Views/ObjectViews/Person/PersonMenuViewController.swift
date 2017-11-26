//
//  PersonMenuViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class PersonMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, optionsViewDelegate, NVActivityIndicatorViewable {

  let viewModel = PersonMenuViewModel()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel.delegate = self
    viewModel.refreshData()
    
    // Check if we have any objects to display
    if viewModel.numberOfSections == 0 {
      self.addIndicator()
    }
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.rowsPerSection[section]
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    
    let personCellModel = viewModel.viewModelForCell(index: indexPath.row)
    
    cell.textLabel?.text = personCellModel.primaryTitle
    cell.detailTextLabel?.text = personCellModel.secondaryTitle
    
    return cell
  }
  
  func refreshView() {
    self.removeIndicator()
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = PersonDetailViewController()
    vc.personModel = viewModel.viewModelForCell(index: indexPath.row)
    
    self.navigationController?.pushViewController(vc, animated: true)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func addIndicator() {
    let size = CGSize(width: 30, height: 30)
    startAnimating(size, message: "Fetching people...", type: .ballClipRotateMultiple)
  }
  
  func removeIndicator() {
    self.stopAnimating()
  }
}



