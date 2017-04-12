//
//  HustleController.swift
//  Hustle
//
//  Created by Eve Denison on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class HustleController: UIViewController {
    
    var allJobSearchRecords = [JobSearch]()
    
    var allTechnicalRecords = [Technical]()
    
    var allNetworkingRecords = [Networking]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateJobSearchRecords()
        updateTechnicalRecords()
        updateNetworkingRecords()
            
    }
    
    func updateJobSearchRecords() {
        CloudKit.shared.getJobSearchRecords { (jobSearchRecord) in
            if let jobSearchRecord = jobSearchRecord {
                self.allJobSearchRecords = jobSearchRecord
//                print("Fetched job search records \(jobSearchRecord[0].didHighVolumeSearch)")
            }
        }
    }
    
    func updateTechnicalRecords() {
        CloudKit.shared.getTechnicalRecords { (technicalSearchRecord) in
            if let technicalSearchRecord = technicalSearchRecord {
                self.allTechnicalRecords = technicalSearchRecord
//                print("Fetched technical search records \(technicalSearchRecord[0].committedToGitHub)")
            }
        }
    }
    
    func updateNetworkingRecords() {
        CloudKit.shared.getNetworkingRecords { (networkingSearchRecord) in
            if let networkingSearchRecord = networkingSearchRecord {
                self.allNetworkingRecords = networkingSearchRecord
//                print("Fetched networking search records \(networkingSearchRecord.infoCoffee)")
            }
        }
    }
    


}
