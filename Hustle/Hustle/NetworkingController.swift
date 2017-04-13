//
//  NetworkingController.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class NetworkingController: UIViewController {
    
    var networking : Networking!
    
    @IBOutlet weak var infoCoffee: UISwitch!
    @IBOutlet weak var meetUps: UISwitch!
    @IBOutlet weak var visitCompanies: UISwitch!
    @IBOutlet weak var followUp: UISwitch!
    @IBOutlet weak var networkingNotes: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let infoCoffee = self.infoCoffee.isOn
        let meetUps = self.meetUps.isOn
        let visitCompanies = self.visitCompanies.isOn
        let followUp = self.followUp.isOn
        let networkingNotes = self.networkingNotes.text ?? ""
        
        let currentNetworkingRecord = Networking.init(infoCoffee: infoCoffee, meetupEvents: meetUps, visitCompanies: visitCompanies, followUp: followUp, networkNotes: networkingNotes)
        
        CloudKit.shared.currentTask.Networking = currentNetworkingRecord
        
        if let recordSaved = Networking.recordFor(networking: currentNetworkingRecord) {
            CloudKit.shared.save(record: recordSaved, completion: { (success) in
                print("Saving Technical Record: \(success)")
        })
        }
    }
}
