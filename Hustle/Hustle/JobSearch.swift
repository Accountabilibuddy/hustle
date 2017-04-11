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
    
    var didHighVolumeSearch : Bool
    var targetedSearch : Bool
    var targetedEvents : Bool
    var companiesAppliedTo : String?
    
    let date: Date
    
    init(didHighVolumeSearch: Bool, targetedSearch: Bool, targetedEvents: Bool, companiesAppliedTo: String, date: Date = Date()) {
        
        self.didHighVolumeSearch = didHighVolumeSearch
        self.targetedSearch = targetedSearch
        self.targetedEvents = targetedEvents
        self.companiesAppliedTo = companiesAppliedTo
        
        self.date = date
    }
}

extension JobSearch {
    
    class func recordFor(jobSearch: JobSearch) -> CKRecord? {
        let record = CKRecord(recordType: "JobSearch")

        record.setValue(jobSearch.didHighVolumeSearch, forKey: "didHighVolumeSearch")
        record.setValue(jobSearch.targetedSearch, forKey: "targetedSearch")
        record.setValue(jobSearch.targetedEvents, forKey: "targetedEvents")
        record.setValue(jobSearch.companiesAppliedTo, forKey: "companiesAppliedTo")
        record.setValue(jobSearch.date, forKey: "date")
        
        return record
    }

}
