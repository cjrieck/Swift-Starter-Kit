//
//  SKViewControllerDataSource.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class ViewControllerDataSource: NSObject, UITableViewDataSource {
    weak var dataTableView: UITableView! // weak here to prevent a retain cycle (potential cause of a memory leak)
    
    // By default, classes and properties are internal (entities are available to the entire module that includes the definition)
    // We want to hide implementation details from other developers which is why we create private properties and methods (entities are available only from within the source file where they are defined)
    private let dataArray: NSMutableArray
    private let firstNames = ["Jay", "Qing", "Clayton", "Rob", "Jill"]
    private let lastNames = ["Smith", "Johnson", "Dixie", "O'Neill", "Wunderlich"]
    
    override init() {
        dataArray = NSMutableArray()
        
        super.init()
        
        // initialization of data
        for i in 0..<20 {
            var firstN = self.firstNames[self.getRandomNumberInRange(0, upperBound: self.firstNames.count - 1)]
            var lastN = self.lastNames[self.getRandomNumberInRange(0, upperBound: self.lastNames.count - 1)]
            var person = PersonModel(firstName: firstN, lastName: lastN, age: self.getRandomNumberInRange(1, upperBound: 100))
            dataArray.addObject(person)
        }
    }
    
    // This is a handy function for other developers to have. We don't want our mutable array of people to be accessible directly. Why? Because we don't want someone to have
    // access to all of the data all of the time. We want to dish out the data on a per need basis and only the exact pieces they want. So we give them this method to better
    // interface with the people data we've created. This returns only 1 person given an index path. Notice we pass an NSIndexPath instead of an Int (of the row) as the argument to this function.
    // It's really personal preference, but it's always good to write modular code. What if a developer wanted to modify this method because the tableview section matters now? Well, now
    // they have to go and change all of the calls to this method to support a row Int and a section Int. OR you can just write the method to accept an NSIndexPath which contains the section
    // and row for you
    func dataForIndexPath(indexPath: NSIndexPath) -> PersonModel! {
        return dataArray.objectAtIndex(indexPath.row) as PersonModel
    }
    
    // MARK: TableView datasource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let person = dataArray.objectAtIndex(indexPath.row) as PersonModel // type cast since objectAtIndex returns type 'AnyObject'
        cell.textLabel.text = person.firstName
        return cell;
    }
    
    // This is a good example of when we'd make a function private. We use this function to determine a random first name, last name and age for a person model, so it's solely used for data generation.
    // If a developer is interfacing with the datasource, they don't care about how the data was generated. Just the data itself. So this method is useless to them. Also, it would be really
    // non-intuitive to have a random number generator method be callable on a datasource object. How does that relate? Just something to consider ;)
    private func getRandomNumberInRange(lowerBound: Int!, upperBound: Int!) -> Int {
        return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1)))
    }
}