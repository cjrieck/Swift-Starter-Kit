//
//  SKViewControllerDataSource.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

public class ViewControllerDataSource: NSObject, UITableViewDataSource {
    public weak var dataTableView: UITableView!
    private let dataArray: NSMutableArray!
    
    private let firstNames = ["Jay", "Qing", "Clayton", "Rob", "Jill"]
    private let lastNames = ["Smith", "Johnson", "Dixie", "O'Neill", "Wunderlich"]
    
    override init() {
        super.init()
        
        // initialization of data
        dataArray = NSMutableArray()
        for i in 0..<20 {
            var firstN = self.firstNames[self.getRandomNumberInRange(0, upperBound: self.firstNames.count - 1)]
            var lastN = self.lastNames[self.getRandomNumberInRange(0, upperBound: self.firstNames.count - 1)]
            var person = PersonModel(firstName: firstN, lastName: lastN, age: self.getRandomNumberInRange(1, upperBound: 100))
            dataArray.addObject(person)
        }
    }
    
    public func dataForIndexPath(indexPath: NSIndexPath) -> PersonModel! {
        return dataArray.objectAtIndex(indexPath.row) as PersonModel
    }
    
    // MARK: TableView datasource methods
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let person = dataArray.objectAtIndex(indexPath.row) as PersonModel
        cell.textLabel.text = person.firstName
        return cell;
    }
    
    private func getRandomNumberInRange(lowerBound: Int!, upperBound: Int!) -> Int {
        return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1)))
    }
}