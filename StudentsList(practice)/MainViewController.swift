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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    
    @IBAction func SortBy(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func FilterBy(_ sender: UISegmentedControl) {
        
    }
    
}
