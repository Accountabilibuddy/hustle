//
//  JobSearchController.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class JobSearchController: UIViewController {

    var jobSearch : JobSearch!
    
    var allJobSearchRecords = [JobSearch]()
    
    @IBOutlet weak var didHighVolumeSearch: UISwitch!
    
    @IBOutlet weak var targetedSearch: UISwitch!
    
    @IBOutlet weak var targetedEvents: UISwitch!
    
    @IBOutlet weak var companiesAppliedTo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        update()
    }
    
    func update() {
        CloudKit.shared.getJobSearchRecords { (jobSearchRecord) in
            if let jobSearchRecord = jobSearchRecord {
                self.allJobSearchRecords = jobSearchRecord
                print("Fetched job search records \(jobSearchRecord[0].didHighVolumeSearch)")
            }
        }
        
    }
    
    
    @IBAction func saveJobSearch(_ sender: Any) {
        
        let didHighVolumeSearch = self.didHighVolumeSearch.isOn
        let targetedSearch = self.targetedSearch.isOn
        let targetedEvents = self.targetedEvents.isOn
        let companiesAppliedTo = self.companiesAppliedTo.text ?? ""
        
        let currentJobSearch = JobSearch.init(didHighVolumeSearch: didHighVolumeSearch, targetedSearch: targetedSearch, targetedEvents: targetedEvents, companiesAppliedTo: companiesAppliedTo)
        if let recordSaved = JobSearch.recordFor(jobSearch: currentJobSearch){
            CloudKit.shared.save(record: recordSaved, completion: { (success) in
                print("Saving Record: \(success)")
            })
        }
    }
}
