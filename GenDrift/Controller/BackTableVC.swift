//
//  BackTableVC.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 10/26/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var TableArray = [String]()
    override func viewDidLoad() {
        TableArray = ["Slider Version", "Spinner Version", "Text Version"]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: TableArray[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    


    
}
