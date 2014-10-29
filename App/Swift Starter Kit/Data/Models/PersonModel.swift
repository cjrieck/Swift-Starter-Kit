//
//  PersonModel.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/29/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import Foundation

enum WalkingDirection {
    case Forwards
    case Backwards
    case Left
    case Right
}

public class PersonModel {
    
    var firstName: String!
    var lastName: String!
    var age: Int?
    
    init(firstName: String!, lastName: String!, age: Int?) {
        self.firstName = firstName
        self.lastName = lastName
        
        // performs a check if age has a value then if it does unwrap that and store in givenAge
        if let givenAge = age {
            self.age = givenAge
        }
    }
    
    func walkForward(direction: WalkingDirection) {
        switch direction {
        case .Forwards:
            println("Walked forwards")
            break
            
        case .Backwards:
            println("Walked forwards")
            break

        case .Left:
            println("Walked forwards")
            break
            
        case .Right:
            println("Walked forwards")
            break
            
        default:
            println("Something went wrong...")
            break
        }
    }
}