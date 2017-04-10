//
//  Post.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit
import CloudKit

class Post{
    
    var jobSearch : JobSearch
    
    init() {

    }
}

enum PostError : Error {
    case writingImageToData
    case writingDataToDisk
}

extension Post {
    class func recordFor(post: Post) throws -> CKRecord? {
        guard let data = UIImageJPEGRepresentation(post.image, 0.7) else { throw PostError.writingImageToData }
        do {
            try data.write(to: post.file.path)
            
            let asset = CKAsset(fileURL: post.file.path)
            let record = CKRecord(recordType: "Post")
            record.setValue(asset, forKey: "image")
            
            return record
        } catch {
            throw PostError.writingDataToDisk
        }
    }
}
