//
//  ProfileController.swift
//  Hustle
//
//  Created by Luay Younus on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CloudKit.shared.getUserID()

        // Do any additional setup after loading the view.
    }
}
