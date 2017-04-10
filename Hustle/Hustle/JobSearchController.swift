//
//  JobSearchController.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class JobSearchController: UIViewController {
    
    var array : [String] = []

    let jobSearch : JobSearch

    @IBAction func fiveCompaniesSwitch(_ sender: Any) {
        if jobSearch.choiceOne == true {
            array.append("Applied for five jobs")
        }
    }
    @IBAction func highVolume(_ sender: Any) {
        
    }
    @IBAction func Research(_ sender: Any) {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let jobSearch = jobSearch {
        
        }
        
    
    }

}
