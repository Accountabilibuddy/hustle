//
//  DailyTasks.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/12/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

//import UIKit
//import CloudKit
//
//class DailyTasks {
//    
//    var JobSearch : JobSearch?
//    var Technical : Technical?
//    var Networking : Networking?

//    func updateJobSearchRecords() {
//        CloudKit.shared.getJobSearchRecords { (jobSearchRecord) in
//            if let jobSearchRecord = jobSearchRecord {
//                self.allJobSearchRecords = jobSearchRecord
////                self.hustleTableView.reloadData()
//            }
//        }
//    }
//    
//    func updateTechnicalRecords() {
//        CloudKit.shared.getTechnicalRecords { (technicalSearchRecord) in
//            if let technicalSearchRecord = technicalSearchRecord {
//                self.allTechnicalRecords = technicalSearchRecord
////                self.hustleTableView.reloadData()
//            }
//        }
//    }
//    
//    func updateNetworkingRecords() {
//        CloudKit.shared.getNetworkingRecords { (networkingSearchRecord) in
//            if let networkingSearchRecord = networkingSearchRecord {
//                self.allNetworkingRecords = networkingSearchRecord
////                self.hustleTableView.reloadData()
//            }
//        }
//    }
//}
