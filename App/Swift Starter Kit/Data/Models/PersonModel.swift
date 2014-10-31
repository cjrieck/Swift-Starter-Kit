//
//  PersonModel.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/29/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import Foundation

// simple enumeration with type WalkingDirection
enum WalkingDirection {
    case Forwards
    case Backwards
    case Left
    case Right
}

class PersonModel {
    
    var firstName: String!
    var lastName: String!
    var age: Int?
    
    init(firstName: String!, lastName: String!, age: Int?) {
        self.firstName = firstName
        self.lastName = lastName
        
        // performs a check if age has a value then if it does unwrap that and store in givenAge
        if let givenAge = age { // proper way to unwrap an optional if unsure if it's nil or has a value
            self.age = givenAge
        }
    }
    
    func walkForward(direction: WalkingDirection) {
        switch direction {
            case .Forwards:
                println("Walked forwards")
            
            case .Backwards:
                println("Walked forwards")
            
            case .Left:
                println("Walked forwards")
            
            case .Right:
                println("Walked forwards")
        }
    }
}