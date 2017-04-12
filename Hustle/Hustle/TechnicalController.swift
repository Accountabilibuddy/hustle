//
//  TechnicalController.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class TechnicalController: UIViewController {
    
    var technical : Technical!
    
    @IBOutlet weak var committedToGitHub: UISwitch!
    
    @IBOutlet weak var codingWars: UISwitch!
    
    @IBOutlet weak var whiteBoarding: UISwitch!
    
    @IBOutlet weak var interviewQuestions: UISwitch!
    
    @IBOutlet weak var techNotes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func technicalSaveSwitch(_ sender: Any) {
        
        let committedToGitHub = self.committedToGitHub.isOn
        let codingWars = self.codingWars.isOn
        let whiteBoarding = self.whiteBoarding.isOn
        let interviewQuestions = self.interviewQuestions.isOn
        let techNotes = self.techNotes.text ?? ""
        
        let currentTechnicalRecord = Technical.init(committedToGitHub: committedToGitHub, codingWars: codingWars, whiteBoarding: whiteBoarding, interviewQuestions: interviewQuestions, techNotes: techNotes)
        
        if let recordSaved = Technical.recordFor(technical: currentTechnicalRecord) {
            CloudKit.shared.save(record: recordSaved, completion: { (success) in
                print("Saving Technical Record: \(success)")
            })
            
        }
        
    }
    

}
