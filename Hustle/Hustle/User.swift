//
//  UserLogin.swift
//  Hustle
//
//  Created by Luay Younus on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit
import CloudKit

class User {
    
    let profileImage : UIImage
    let displayName : String
    
    init(profileImage: UIImage, displayName: String) {
        self.profileImage = profileImage
        self.displayName = displayName
    }
}

enum RecordError : Error {
    case writingImageToData
    case writingDataToDisk
}

//MARK: Uploading ProfileImage to the Cloud
extension User {
    
    class func recordFor(user: User) throws -> CKRecord? {
        guard let data = UIImageJPEGRepresentation(user.profileImage, 0.6) else {throw RecordError.writingImageToData}
        
        
        
        do{
            
            let imagePath = user.profileImage.path.appendingPathComponent(user.displayName)
            
            
            
            try data.write(to: imagePath)
            
            let asset = CKAsset(fileURL: imagePath)
            
            let record = CKRecord(recordType: "ProfileImage")
            
            record.setValue(asset,forKey:"image")
            
            return record
            
        } catch {
            throw RecordError.writingDataToDisk
        }
        
    }
}

