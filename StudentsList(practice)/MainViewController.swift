//
//  MainViewController.swift
//  StudentsList(practice)
//
//  Created by Dongwoo Pae on 5/26/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var sortbySegmentedControl: UISegmentedControl!
    @IBOutlet weak var filterbySegmentedControl: UISegmentedControl!
    
    var studentController = StudentController()
    var studentListTableViewController: StudentListTableViewController! {
        didSet {
            updateData()
        }
    }
    
    private var students: [Student] = [] {
        didSet {
            updateData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.studentController.loadFromPersistentStore { (students, error) in
            if let error = error {
                print("There was an error loading students \(error)")
                return
            } else {
                DispatchQueue.main.async {
                    self.students = students ?? []
                }
            }
        }
        

    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentListEmbedSegue" {
            self.studentListTableViewController = segue.destination as! StudentListTableViewController
        }
    }

    
    @IBAction func SortBy(_ sender: UISegmentedControl) {
        updateData()
    }
    
    @IBAction func FilterBy(_ sender: UISegmentedControl) {
        updateData()
    }
    
    private func updateData() {
        var filterAndSortedList : [Student]
        
        switch filterbySegmentedControl.selectedSegmentIndex {
        case 1:
            filterAndSortedList = self.students.filter {$0.course == "iOS"}
        case 2:
            filterAndSortedList = self.students.filter {$0.course == "Web"}
        case 3:
            filterAndSortedList = self.students.filter {$0.course == "UX"}
        default:
            filterAndSortedList = self.students
        }
        
        if self.sortbySegmentedControl.selectedSegmentIndex == 0 {
            filterAndSortedList = filterAndSortedList.sorted(by: { (student, nextStudent) -> Bool in
                return student.firstName < nextStudent.firstName
            })
        } else {
            filterAndSortedList = filterAndSortedList.sorted {$0.lastName < $1.lastName}
        }
        self.studentListTableViewController.students = filterAndSortedList
    }
}
