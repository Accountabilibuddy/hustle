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
    
    init(profileImage: UIImage) {
        self.profileImage = profileImage
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
            try data.write(to: user.profileImage.path)
            
            let asset = CKAsset(fileURL: user.profileImage.path)
            
            let record = CKRecord(recordType: "ProfileImage")
            
            record.setValue(asset,forKey:"image")
            
            return record
            
        } catch {
            throw RecordError.writingDataToDisk
        }
        
    }
}

