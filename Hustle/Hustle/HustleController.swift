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
    


    @IBOutlet weak var hustleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hustleTableView.delegate = self
        self.hustleTableView.dataSource = self
        
        self.hustleTableView.estimatedRowHeight = 50
        self.hustleTableView.rowHeight = UITableViewAutomaticDimension
        CloudKit.shared.getJobSearchRecords { (jobSearch) in
            OperationQueue.main.addOperation {
                self.allJobSearchRecords = jobSearch  ?? []
                print(self.allJobSearchRecords.count)
                self.hustleTableView.reloadData()
            }
        }

        let jobSearchNibCell = UINib(nibName: JobSearchNibCell.identifier, bundle: nil)
        self.hustleTableView.register(jobSearchNibCell, forCellReuseIdentifier: JobSearchNibCell.identifier)
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
                self.hustleTableView.reloadData()
//                print("Fetched job search records \(jobSearchRecord[0].didHighVolumeSearch)")
            }
        }
    }
    
    func updateTechnicalRecords() {
        CloudKit.shared.getTechnicalRecords { (technicalSearchRecord) in
            if let technicalSearchRecord = technicalSearchRecord {
                self.allTechnicalRecords = technicalSearchRecord
                self.hustleTableView.reloadData()
//                print("Fetched technical search records \(technicalSearchRecord[0].committedToGitHub)")
            }
        }
    }
    
    func updateNetworkingRecords() {
        CloudKit.shared.getNetworkingRecords { (networkingSearchRecord) in
            if let networkingSearchRecord = networkingSearchRecord {
                self.allNetworkingRecords = networkingSearchRecord
                self.hustleTableView.reloadData()
//                print("Fetched networking search records \(networkingSearchRecord.infoCoffee)")
            }
        }
    }
}

extension HustleController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allJobSearchRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hustleTableView.dequeueReusableCell(withIdentifier: JobSearchNibCell.identifier, for: indexPath) as! JobSearchNibCell
        
        let jobSearchRecord = self.allJobSearchRecords[indexPath.row]
        print(jobSearchRecord.didHighVolumeSearch)
        cell.jobSearchRecord = jobSearchRecord
        
        return cell
    }
}
































