//
//  StarWarsOptionsViewController.swift
//  StarWarsPractice
//
//  Created by Simon Smiley-Andrews on 21/11/17.
//  Copyright © 2017 Simon Smiley-Andrews. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import PromiseKit

protocol optionsMenuDelegate: class {
  func getPrimaryTextWithIndex(index: Int) -> String
  func getSecondaryTextWithIndex(index: Int) -> String
  func getNumberOfRowsInSection(section: Int) -> Int
  func getViewControllerForIndex(index: Int) -> UIViewController
  func getLoadingString() -> String
  
  //func refreshData(completionHandler: @escaping (NSArray) -> ())
  func refreshData() -> Promise<Any>
}

class StarWarsOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NVActivityIndicatorViewable {

  var delegate: optionsMenuDelegate?
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.addIndicator()
    
    self.delegate?.refreshData().then() {
      (Any) -> Void in
      self.tableView.reloadData()
    }.catch() {
      (e: Error) in
      print("Download error")
    }.always() {
      self.removeIndicator()
    }
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    
    cell.textLabel?.text = delegate?.getPrimaryTextWithIndex(index: indexPath.row)
    cell.detailTextLabel?.text = delegate?.getSecondaryTextWithIndex(index: indexPath.row)
  
    return cell
  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return delegate!.getNumberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = delegate!.getViewControllerForIndex(index: indexPath.row)
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
