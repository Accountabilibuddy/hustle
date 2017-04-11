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
typealias UserCompletion = ([User])->()

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
                print("record \(record)")
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
    
    func getTechnicalRecords(completion: @escaping TechnicalCompletion) {
        let recordQuery = CKQuery(recordType: "Technical", predicate: NSPredicate(value: true))
        
        self.publicDatabase.perform(recordQuery, inZoneWith: nil) { (records, error) in
            if  error != nil {
                OperationQueue.main.addOperation {
                    completion(nil)
                }
            }
            
            if let records = records {
                var technicalRecord = [Technical]()
                
                for record in records {
                    if let committedToGitHub = record["committedToGitHub"] as? Bool,
                        let codingWars = record["codingWars"] as? Bool,
                        let whiteBoarding = record["whiteBoarding"] as? Bool,
                        let interviewQuestions = record["interviewQuestions"] as? Bool,
                        let techNotes = record["techNotes"] as? String,
                        let date = record["date"] as? Date
                        
                    {
                        let newRecord = Technical(committedToGitHub: committedToGitHub, codingWars: codingWars, whiteBoarding: whiteBoarding, interviewQuestions: interviewQuestions,  techNotes: techNotes, date: date)
                        technicalRecord.append(newRecord)
                    }
                }
                OperationQueue.main.addOperation {
                    completion(technicalRecord)
                }
            }
        }
    }
    
    func getNetworkingRecords(completion: @escaping NetworkingCompletion) {
        let recordQuery = CKQuery(recordType: "Networking", predicate: NSPredicate(value: true))
        
        self.publicDatabase.perform(recordQuery, inZoneWith: nil) { (records, error) in
            if  error != nil {
                OperationQueue.main.addOperation {
                    completion(nil)
                }
            }
            
            if let records = records {
                var networkRecord = [Networking]()
                
                for record in records {
                    if let infoCoffee = record["infoCoffee"] as? Bool,
                        let meetUps = record["meetUps"] as? Bool,
                        let visitCompanies = record["visitCompanies"] as? Bool,
                        let followUp = record["followUp"] as? Bool,
                        let networkingNotes = record["networkingNotes"] as? String,
                        let date = record["date"] as? Date
                        
                    {
                        let newRecord = Networking(infoCoffee: infoCoffee, meetupEvents: meetUps, visitCompanies: visitCompanies, followUp: followUp, networkNotes: networkingNotes, date: date)
                        networkRecord.append(newRecord)
                    }
                }
                OperationQueue.main.addOperation {
                    completion(networkRecord)
                }
            }
        }
    }
    
    func getUserID(){
        CKContainer.default().requestApplicationPermission(.userDiscoverability) { (status, error) in
            CKContainer.default().fetchUserRecordID(completionHandler: { (record, error) in
                CKContainer.default().discoverUserIdentity(withUserRecordID: record!, completionHandler: { (userID, error) in
                    print(userID?.hasiCloudAccount)
                    print((userID?.nameComponents?.givenName)! + " " + (userID?.nameComponents?.familyName)!)
                })
            })
        }
    }
    
    
}




























