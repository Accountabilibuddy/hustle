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
    @IBOutlet weak var dateOfJobSearch: UILabel!
    
    
    var jobSearchRecord : JobSearch! {
        didSet {
            
            self.didHighVolumeSearch.isHidden = !jobSearchRecord.didHighVolumeSearch
            self.targetedSearch.isHidden = !jobSearchRecord.targetedSearch
            self.targetedEvents.isHidden = !jobSearchRecord.targetedEvents
            self.companiesAppliedTo.text = jobSearchRecord.companiesAppliedTo
            self.dateOfJobSearch.text = DateFormatter.localizedString(from: jobSearchRecord.date, dateStyle: .short, timeStyle: .short)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
