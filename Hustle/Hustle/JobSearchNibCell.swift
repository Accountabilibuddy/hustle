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
    

    
    
    var dailyTasks : JobSearch! {
        didSet {
            
            self.didHighVolumeSearch.isHidden = !dailyTasks.didHighVolumeSearch
            self.targetedSearch.isHidden = !dailyTasks.targetedSearch
            self.targetedEvents.isHidden = !dailyTasks.targetedEvents
            self.committedToGitHub.isHidden = !dailyTasks.committedToGitHub
            self.codingWars.isHidden = !dailyTasks.codingWars
            self.whiteBoarding.isHidden = !dailyTasks.whiteBoarding
            self.interviewQuestions.isHidden = !dailyTasks.interviewQuestions
            self.infoCoffee.isHidden = !dailyTasks.infoCoffee
            self.meetups.isHidden = !dailyTasks.meetupEvents
            self.visitCompanies.isHidden = !dailyTasks.visitCompanies
            self.followUp.isHidden = !dailyTasks.followUp
            
            self.textFieldNotes.text = dailyTasks.textFieldNotes
            self.date.text = DateFormatter.localizedString(from: (dailyTasks.date), dateStyle: .short, timeStyle: .short)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
