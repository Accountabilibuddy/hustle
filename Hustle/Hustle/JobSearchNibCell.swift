//
//  JobSearchNibCell.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class JobSearchNibCell: UITableViewCell {
    
//    let jobSearchRecords : JobSearch! {
//        didSet{
//            self.didHighVolumeSearch.text =
//        }
//    }

    
    @IBOutlet weak var didHighVolumeSearch: UILabel!
    
    @IBOutlet weak var targetedSearch: UILabel!
    
    @IBOutlet weak var targetedEvents: UILabel!
    
    @IBOutlet weak var companiesAppliedTo: UILabel!
    
    @IBOutlet weak var dateOfJobSearch: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


//    job.didHighVolumeSearch = "Hellooooo"
    //        self.targetedSearch = targetedSearch
    //        self.targetedEvents = targetedEvents
    //        self.companiesAppliedTo = companiesAppliedTo
    //
    //        self.date = date
}
