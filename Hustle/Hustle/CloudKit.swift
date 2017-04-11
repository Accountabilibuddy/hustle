//
//  CloudKit.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit
import CloudKit

typealias SuccessCompletion = (Bool) -> ()
typealias JobSearchCompletion = ([JobSearch]?)->()
typealias TechnicalCompletion = ([Technical]?)->()
typealias NetworkingCompletion = ([Networking]?)->()

class CloudKit {
    
    static let shared = CloudKit()
    
    let container = CKContainer.default()
    
    var publicDatabase : CKDatabase {
        return container.publicCloudDatabase
    }
    
    func save(record: CKRecord, completion: @escaping SuccessCompletion) {
        publicDatabase.save(record, completionHandler: { (record, error) in
            if error != nil {
                completion(false)
            }
            if let record = record {
                print(record)
                completion(true)
            } else {
                completion(false)
            }
            
        })
    }
    
    func getJobSearchRecords(completion: @escaping JobSearchCompletion) {
        let recordQuery = CKQuery(recordType: "JobSearch", predicate: NSPredicate(value: true))
        
        self.publicDatabase.perform(recordQuery, inZoneWith: nil) { (records, error) in
            if  error != nil {
                OperationQueue.main.addOperation {
                    completion(nil)
                }
            }
            
            if let records = records {
                var jobSearchRecord = [JobSearch]()
                
                for record in records {
                    if let didHighVolumeSearch = record["didHighVolumeSearch"] as? Bool,
                        let targetedSearch = record["targetedSearch"] as? Bool,
                        let targetedEvents = record["targetedEvents"] as? Bool,
                        let companiesAppliedTo = record["companiesAppliedTo"] as? String,
                        let date = record["date"] as? Date
                        
                    {
                        let newRecord = JobSearch(didHighVolumeSearch: didHighVolumeSearch, targetedSearch: targetedSearch, targetedEvents: targetedEvents, companiesAppliedTo: companiesAppliedTo, date: date)
                        jobSearchRecord.append(newRecord)
                    }
                }
                OperationQueue.main.addOperation {
                    completion(jobSearchRecord)
                }
            }
        }
    }
}
