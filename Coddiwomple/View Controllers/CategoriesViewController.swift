//
//  CategoriesViewController.swift
//  Coddiwomple
//
//  Created by Brian Sakhuja on 3/11/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var categories = [CategoricalList]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].nameOfCategory
        
        return cell
    }

}
