//
//  StarWarsOptionsViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 21/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol optionsMenuDelegate: class {
  func getPrimaryTextWithIndex(index: Int) -> String
  func getSecondaryTextWithIndex(index: Int) -> String
}

class StarWarsOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, optionsViewDelegate, NVActivityIndicatorViewable {

  weak var delegate: optionsMenuDelegate?
  
  @IBOutlet weak var tableView: UITableView!
  
  // If we have a delegate method we can set the delegate
  // Then we can just call delegate..getPrimaryText etc and return the correct model for this
  
  
  var viewModel:ObjectModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.addIndicator()
    
    viewModel.delegate = self
    viewModel.refreshData()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    
    cell.textLabel?.text = delegate?.getPrimaryTextWithIndex(index: indexPath.row)
    cell.detailTextLabel?.text = delegate?.getSecondaryTextWithIndex(index: indexPath.row)
    
//    cell.textLabel?.text = viewModel.getPrimaryTextWithIndex(index: indexPath.row)
//    cell.detailTextLabel?.text = viewModel.getSecondaryTextWithIndex(index: indexPath.row)
    
    cell.detailTextLabel?.text = "Secondary"
    
    return cell
  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getNumberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = viewModel.getViewControllerForIndex(index: indexPath.row)
    self.navigationController?.pushViewController(vc, animated: true)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func refreshView() {
    self.removeIndicator()
    tableView.reloadData()
  }
  
  func addIndicator() {
    let size = CGSize(width: 30, height: 30)
    startAnimating(size, message: viewModel.loadingString, type: .ballClipRotateMultiple)
  }
  
  func removeIndicator() {
    self.stopAnimating()
  }
}
