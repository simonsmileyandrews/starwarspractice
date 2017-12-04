//
//  StarWarsOptionsViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 21/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol OptionsMenuDelegate: class {
  func getPrimaryTextWith(index: Int) -> String
  func getSecondaryTextWith(index: Int) -> String
  func refreshData(completionHandler: @escaping (NSArray) -> ())
  func getNumberOfRowsIn(section: Int) -> Int
  func getViewControllerWith(index: Int) -> UIViewController
  func getLoadingString() -> String
}

class StarWarsOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NVActivityIndicatorViewable {

  var delegate: OptionsMenuDelegate?
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.addIndicator()
    self.delegate?.refreshData(completionHandler: { (objects) in
      self.removeIndicator()
      self.tableView.reloadData()
    })
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell_identifier)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cell_identifier)
    
    cell.textLabel?.text = delegate?.getPrimaryTextWith(index: indexPath.row)
    cell.detailTextLabel?.text = delegate?.getSecondaryTextWith(index: indexPath.row)
  
    return cell
  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return delegate!.getNumberOfRowsIn(section: section)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = delegate!.getViewControllerWith(index: indexPath.row)
    self.navigationController?.pushViewController(vc, animated: true)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func addIndicator() {
    let size = CGSize(width: 30, height: 30)
    startAnimating(size, message: delegate!.getLoadingString(), type: .ballClipRotateMultiple)
  }

  func removeIndicator() {
    self.stopAnimating()
  }
}
