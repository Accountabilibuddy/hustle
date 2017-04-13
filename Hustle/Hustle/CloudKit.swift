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
typealias UserCompletion = ([User])->()
typealias ProfileName = (String)->()
typealias ProfileImage = (UIImage?)->()

class CloudKit {
    
    static let shared = CloudKit()
    
    
    var userName = String()
    
    let container = CKContainer.default()
    
    var publicDatabase : CKDatabase {
        return container.publicCloudDatabase
    }
    
    
    //save method for regular records
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
    
    //save method ONLY for profile image
    func saveProfileImage(user: User, completion: @escaping SuccessCompletion){
        do {
            if let record = try User.recordFor(user: user){
                publicDatabase.save(record, completionHandler: { (record, error) in
                    if error != nil {
                        completion(false)
                        return
                    }
                    if let record = record {
                        print("image record is being printed: \(record)")
                        completion(true)
                    } else {
                        completion(false)
                    }
                })
            }
        } catch{
            print(error)
        }
    }
    
    func getProfileImageRecord(completion: @escaping ProfileImage){
        
        let imageQuery = CKQuery(recordType: "ProfileImage", predicate: NSPredicate(value: true))
        
        self.publicDatabase.perform(imageQuery, inZoneWith: nil) { (records, error) in
            
            if error != nil {
                OperationQueue.main.addOperation {
                    completion(nil)
                }
            }
            
            if let records = records {
                let record = records.first
                if let asset = record?["userImage"] as? CKAsset {
                    print("ASSET\(asset)") //dont delete this print statement because I dont know
                    let path = asset.fileURL.path
                    if let image = UIImage(contentsOfFile: path){
                        OperationQueue.main.addOperation {
                            completion(image)
                        }
                    }
                }
            }
        }
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
                        let committedToGitHub = record["committedToGitHub"] as? Bool,
                        let codingWars = record["codingWars"] as? Bool,
                        let whiteBoarding = record["whiteBoarding"] as? Bool,
                        let interviewQuestions = record["interviewQuestions"] as? Bool,
                        let infoCoffee = record["infoCoffee"] as? Bool,
                        let meetupEvents = record["meetupEvents"] as? Bool,
                        let visitCompanies = record["visitCompanies"] as? Bool,
                        let followUp = record["followUp"] as? Bool,
                        let textFieldNotes = record["textFieldNotes"] as? String,
                        let date = record["date"] as? Date
                        
                    {
                        let newRecord = JobSearch(didHighVolumeSearch: didHighVolumeSearch, targetedSearch: targetedSearch, targetedEvents: targetedEvents, committedToGitHub: committedToGitHub, codingWars: codingWars, whiteBoarding: whiteBoarding, interviewQuestions: interviewQuestions, infoCoffee: infoCoffee, meetupEvents: meetupEvents, visitCompanies: visitCompanies, followUp: followUp, textFieldNotes: textFieldNotes, date: date)
                            jobSearchRecord.append(newRecord)
                    }
                }
                print()
                OperationQueue.main.addOperation {
                    completion(jobSearchRecord)
                }
            }
        }
    }
    
    
    func getUserID(completion: @escaping ProfileName) {
        CKContainer.default().requestApplicationPermission(.userDiscoverability) { (status, error) in
            CKContainer.default().fetchUserRecordID(completionHandler: { (record, error) in
                CKContainer.default().discoverUserIdentity(withUserRecordID: record!, completionHandler: { (userID, error) in
                    print(userID?.hasiCloudAccount ?? "User Name not Defined")
                    self.userName = ((userID?.nameComponents?.givenName)! + " " + (userID?.nameComponents?.familyName)!)
                    
                    OperationQueue.main.addOperation {
                        completion(self.userName)
                    }
                })
            })
        }
    }
}

