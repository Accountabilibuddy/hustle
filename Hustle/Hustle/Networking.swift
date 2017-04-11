//
//  Networking.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation
import CloudKit

class Networking {
    
    var infoCoffee : Bool
    var meetupEvents : Bool
    var visitCompanies : Bool
    var followUp : Bool
    var networkNotes : String?
    let date : Date
    
    init(infoCoffee: Bool, meetupEvents: Bool, visitCompanies: Bool, followUp: Bool, networkNotes: String, date: Date = Date()) {
        
        self.infoCoffee = infoCoffee
        self.meetupEvents = meetupEvents
        self.visitCompanies = visitCompanies
        self.followUp = followUp
        self.networkNotes = networkNotes
        self.date = date
    }
}

extension Networking {
    
    class func recordFor(networking : Networking) -> CKRecord? {
        let record = CKRecord(recordType: "Networking")
        
        record.setValue(networking.infoCoffee, forKey: "infoCoffee")
        record.setValue(networking.meetupEvents, forKey: "meetupEvents")
        record.setValue(networking.visitCompanies, forKey: "visitCompanies")
        record.setValue(networking.followUp, forKey: "followUp")
        record.setValue(networking.networkNotes, forKey: "networkingNotes")
        record.setValue(networking.date, forKey: "date")
        
        return record
    }
}
