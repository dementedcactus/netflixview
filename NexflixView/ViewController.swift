//
//  ViewController.swift
//  NexflixView
//
//  Created by Richard Crichlow on 12/24/17.
//  Copyright © 2017 Richard Crichlow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // example data model
    let dataModelArray = ["Data1", "Data2", "Data3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thisTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID", for: indexPath) as! CustomTableViewCell
        
        thisTableViewCell.configureCollectionView(forCell: thisTableViewCell, forIndexPath: indexPath)
        
        return thisTableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
