//
//  JobSearchController.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class JobSearchController: UIViewController {

    var jobSearch : JobSearch!
    
    @IBOutlet weak var didHighVolumeSearch: UISwitch!
    @IBOutlet weak var targetedSearch: UISwitch!
    @IBOutlet weak var targetedEvents: UISwitch!
    @IBOutlet weak var companiesAppliedTo: UITextView!
    
    @IBOutlet weak var infoCoffee: UISwitch!
    @IBOutlet weak var meetUp: UISwitch!
    @IBOutlet weak var visitCompanies: UISwitch!
    @IBOutlet weak var followUp: UISwitch!
    
    @IBOutlet weak var commitToGitHub: UISwitch!
    @IBOutlet weak var codingWars: UISwitch!
    @IBOutlet weak var whiteBoarding: UISwitch!
    @IBOutlet weak var interviewQuestions: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func saveJobSearch(_ sender: Any) {
        
        let didHighVolumeSearch = self.didHighVolumeSearch.isOn
        let targetedSearch = self.targetedSearch.isOn
        let targetedEvents = self.targetedEvents.isOn
        
        let committedToGitHub = self.commitToGitHub.isOn
        let codingWars = self.codingWars.isOn
        let whiteBoarding = self.whiteBoarding.isOn
        let interviewQuestions = self.interviewQuestions.isOn
        
        let infoCoffee = self.infoCoffee.isOn
        let meetUps = self.meetUp.isOn
        let visitCompanies = self.visitCompanies.isOn
        let followUp = self.followUp.isOn
        
        let companiesAppliedTo = self.companiesAppliedTo.text ?? ""
        
        let currentJobSearch = JobSearch.init(didHighVolumeSearch: didHighVolumeSearch, targetedSearch: targetedSearch, targetedEvents: targetedEvents, committedToGitHub: committedToGitHub, codingWars: codingWars, whiteBoarding: whiteBoarding, interviewQuestions: interviewQuestions, infoCoffee: infoCoffee, meetupEvents: meetUps, visitCompanies: visitCompanies, followUp: followUp, companiesAppliedTo: companiesAppliedTo)
        
//        CloudKit.shared.currentTask.JobSearch = currentJobSearch
        
        if let recordSaved = JobSearch.recordFor(jobSearch: currentJobSearch){
            CloudKit.shared.save(record: recordSaved, completion: { (success) in
                print("Saving Record: \(success)")
            })
        }
    }
}
