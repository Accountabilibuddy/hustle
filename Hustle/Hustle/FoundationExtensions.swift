//
//  FoundationExtensions.swift
//  Hustle
//
//  Created by Luay Younus on 4/12/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    func getUserImage() -> String? {
        guard let profileImage = UserDefaults.standard.string(forKey: "profile_image") else { return nil }
        
        return profileImage
    }
    
    func saveUserImageWith(profileImage: String) -> Bool {
        UserDefaults.standard.set(profileImage, forKey: "profile_image")

        return UserDefaults.standard.synchronize()
    }
}
