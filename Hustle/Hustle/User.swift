//
//  UserLogin.swift
//  Hustle
//
//  Created by Luay Younus on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation

class User {
    let name : String
    let profileImageURL : String?
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String {
            self.name = name
            self.profileImageURL = json["picture"] as? String
        } else {
            return nil
        }
    }
}
