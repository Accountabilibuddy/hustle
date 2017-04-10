//
//  JobSearch.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation

class JobSearch {
    
    let choiceOne : Bool
    let choiceTwo : Bool
    let choiceThree : Bool
    var textField : String
    
    init(choiceOne: Bool, choiceTwo: Bool, choiceThree: Bool, textField: String) {
        
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
        self.choiceThree = choiceThree
        self.textField = textField
    }
}
