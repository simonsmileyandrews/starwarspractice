//
//  FilmMenuViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 23/11/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

import UIKit
import Foundation
import NVActivityIndicatorView

class FilmMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, optionsViewDelegate, NVActivityIndicatorViewable {
  
  let viewModel = FilmMenuViewModel()
  
  @IBOutlet weak var tableView: UITableView!
  
  var activityIndicator: NVActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.delegate = self
    viewModel.refreshData()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    self.addIndicator()
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.rowsPerSection[section]
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    
    let filmCellModel = viewModel.viewModelForCell(index: indexPath.row)
    
    cell.textLabel?.text = filmCellModel.primaryTitle
    cell.detailTextLabel?.text = filmCellModel.secondaryTitle
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = FilmDetailViewController()
    vc.filmModel = viewModel.viewModelForCell(index: indexPath.row)
    
    self.navigationController?.pushViewController(vc, animated: true)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func refreshView() {
    self.removeIndicator()
    tableView.reloadData()
  }
  
  func addIndicator() {
    let size = CGSize(width: 30, height: 30)
    startAnimating(size, message: "Fetching films...", type: .ballClipRotateMultiple)
  }
  
  func removeIndicator() {
    self.stopAnimating()
  }
}
