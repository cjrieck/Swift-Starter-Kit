//
//  SKViewControllerDataSource.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import Foundation
import UIKit

public class SKViewControllerDataSource: NSObject, UITableViewDataSource {
    public weak var dataTableView: UITableView!
    private let dataArray: NSMutableArray!
    
    override init() {
        super.init()

        // initialization of data
        dataArray = NSMutableArray()
        for i in 0...20 {
            dataArray.addObject(i)
        }
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
        cell.textLabel.text = "Cell \(dataArray.objectAtIndex(indexPath.row))"
        return cell;
    }
}