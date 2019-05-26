//
//  StudentListTableViewController.swift
//  StudentsList(practice)
//
//  Created by Dongwoo Pae on 5/26/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController {

    var students: [Student] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let student = students[indexPath.row]
            cell.textLabel?.text = student.name
            cell.detailTextLabel?.text = student.course
        return cell
    }

}
