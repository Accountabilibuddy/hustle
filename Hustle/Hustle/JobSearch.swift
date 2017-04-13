//
//  JobSearch.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation
import CloudKit

class JobSearch {
    
    //Job Search
    var didHighVolumeSearch : Bool
    var targetedSearch : Bool
    var targetedEvents : Bool
    
    //Technical
    var committedToGitHub : Bool
    var codingWars : Bool
    var whiteBoarding : Bool
    var interviewQuestions : Bool
    
    //Networking
    var infoCoffee : Bool
    var meetupEvents : Bool
    var visitCompanies : Bool
    var followUp : Bool
    
    var textFieldNotes : String?
    
    let date: Date
    
    init(didHighVolumeSearch: Bool, targetedSearch: Bool, targetedEvents: Bool, committedToGitHub: Bool, codingWars: Bool, whiteBoarding: Bool, interviewQuestions: Bool, infoCoffee: Bool, meetupEvents: Bool, visitCompanies: Bool, followUp: Bool, textFieldNotes: String, date: Date = Date()) {
        
        self.didHighVolumeSearch = didHighVolumeSearch
        self.targetedSearch = targetedSearch
        self.targetedEvents = targetedEvents
        
        self.committedToGitHub = committedToGitHub
        self.codingWars = codingWars
        self.whiteBoarding = whiteBoarding
        self.interviewQuestions = interviewQuestions
        
        self.infoCoffee = infoCoffee
        self.meetupEvents = meetupEvents
        self.visitCompanies = visitCompanies
        self.followUp = followUp
        
        self.textFieldNotes = textFieldNotes
        
        self.date = date
    }
}

extension JobSearch {
    
    class func recordFor(jobSearch: JobSearch) -> CKRecord? {
        let record = CKRecord(recordType: "JobSearch")

        record.setValue(jobSearch.didHighVolumeSearch, forKey: "didHighVolumeSearch")
        record.setValue(jobSearch.targetedSearch, forKey: "targetedSearch")
        record.setValue(jobSearch.targetedEvents, forKey: "targetedEvents")
        
        record.setValue(jobSearch.committedToGitHub, forKey: "committedToGitHub")
        record.setValue(jobSearch.codingWars, forKey: "codingWars")
        record.setValue(jobSearch.whiteBoarding, forKey: "whiteBoarding")
        record.setValue(jobSearch.interviewQuestions, forKey: "interviewQuestions")

        record.setValue(jobSearch.infoCoffee, forKey: "infoCoffee")
        record.setValue(jobSearch.meetupEvents, forKey: "meetupEvents")
        record.setValue(jobSearch.visitCompanies, forKey: "visitCompanies")
        record.setValue(jobSearch.followUp, forKey: "followUp")

        record.setValue(jobSearch.textFieldNotes, forKey: "textFieldNotes")
        record.setValue(jobSearch.date, forKey: "date")
        
        return record
    }

}
