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
    @IBOutlet weak var companiesAppliedTo: UILabel!
    @IBOutlet weak var committedToGitHub: UILabel!
    @IBOutlet weak var codingWars: UILabel!
    @IBOutlet weak var whiteBoarding: UILabel!
    @IBOutlet weak var interviewQuestions: UILabel!
    @IBOutlet weak var techNotes: UILabel!
    @IBOutlet weak var infoCoffee: UILabel!
    @IBOutlet weak var meetups: UILabel!
    @IBOutlet weak var visitCompanies: UILabel!
    @IBOutlet weak var followUp: UILabel!
    @IBOutlet weak var networkingNotes: UILabel!
    @IBOutlet weak var date: UILabel!
    

    
    
    var dailyTasks : DailyTasks! {
        didSet {
            
            self.didHighVolumeSearch.isHidden = !(dailyTasks.JobSearch?.didHighVolumeSearch)!
            self.targetedSearch.isHidden = !(dailyTasks.JobSearch?.targetedSearch)!
            self.targetedEvents.isHidden = !(dailyTasks.JobSearch?.targetedEvents)!
            self.companiesAppliedTo.text = dailyTasks.JobSearch?.companiesAppliedTo
            self.committedToGitHub.isHidden = !(dailyTasks.Technical?.committedToGitHub)!
            self.codingWars.isHidden = !(dailyTasks.Technical?.codingWars)!
            self.whiteBoarding.isHidden = !(dailyTasks.Technical?.whiteBoarding)!
            self.interviewQuestions.isHidden = !(dailyTasks.Technical?.interviewQuestions)!
            self.techNotes.text = dailyTasks.Technical?.techNotes
            self.infoCoffee.isHidden = !(dailyTasks.Networking?.infoCoffee)!
            self.meetups.isHidden = !(dailyTasks.Networking?.meetupEvents)!
            self.visitCompanies.isHidden = !(dailyTasks.Networking?.visitCompanies)!
            self.followUp.isHidden = !(dailyTasks.Networking?.followUp)!
            self.networkingNotes.text = dailyTasks.Networking?.networkNotes
            self.date.text = DateFormatter.localizedString(from: (dailyTasks.JobSearch?.date)!, dateStyle: .short, timeStyle: .short)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
