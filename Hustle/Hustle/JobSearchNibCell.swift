//
//  JobSearchNibCell.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class JobSearchNibCell: UITableViewCell {
    
    
    @IBOutlet weak var didHighVolumeSearch: UILabel!
    @IBOutlet weak var targetedSearch: UILabel!
    @IBOutlet weak var targetedEvents: UILabel!
    @IBOutlet weak var textFieldNotes: UILabel!
    @IBOutlet weak var committedToGitHub: UILabel!
    @IBOutlet weak var codingWars: UILabel!
    @IBOutlet weak var whiteBoarding: UILabel!
    @IBOutlet weak var interviewQuestions: UILabel!
    @IBOutlet weak var infoCoffee: UILabel!
    @IBOutlet weak var meetups: UILabel!
    @IBOutlet weak var visitCompanies: UILabel!
    @IBOutlet weak var followUp: UILabel!
    @IBOutlet weak var date: UILabel!
    

    
    
    var jobSearchRecords : JobSearch! {
        didSet {
            
            self.didHighVolumeSearch.isHidden = !jobSearchRecords.didHighVolumeSearch
            self.targetedSearch.isHidden = !jobSearchRecords.targetedSearch
            self.targetedEvents.isHidden = !jobSearchRecords.targetedEvents
            self.committedToGitHub.isHidden = !jobSearchRecords.committedToGitHub
            self.codingWars.isHidden = !jobSearchRecords.codingWars
            self.whiteBoarding.isHidden = !jobSearchRecords.whiteBoarding
            self.interviewQuestions.isHidden = !jobSearchRecords.interviewQuestions
            self.infoCoffee.isHidden = !jobSearchRecords.infoCoffee
            self.meetups.isHidden = !jobSearchRecords.meetupEvents
            self.visitCompanies.isHidden = !jobSearchRecords.visitCompanies
            self.followUp.isHidden = !jobSearchRecords.followUp
            
            self.textFieldNotes.text = jobSearchRecords.textFieldNotes
            self.date.text = DateFormatter.localizedString(from: (jobSearchRecords.date), dateStyle: .short, timeStyle: .short)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
