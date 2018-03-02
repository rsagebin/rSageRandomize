//
//  RandomizeTableViewController.swift
//  Randomize
//
//  Created by Rodrigo Sagebin on 3/2/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import UIKit

class RandomizeTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource/Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RandomizeController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let randCon = RandomizeController.shared
            let entry = randCon.entries[indexPath.row]
            randCon.remove(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        let entry = RandomizeController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.name
        return cell
    }
}