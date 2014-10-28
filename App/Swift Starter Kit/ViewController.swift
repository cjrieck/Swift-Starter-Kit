//
//  ViewController.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var classTableView: UITableView!
    
    init(title: String!) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.autoresizesSubviews = true
        
        // add code during view init
        let viewHeight = CGRectGetHeight(self.view.frame)
        let viewWidth = CGRectGetWidth(self.view.frame)
        
        var classTableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        classTableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        classTableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        classTableView.delegate = self
        classTableView.dataSource = self
        self.view.addSubview(classTableView)
        self.classTableView = classTableView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editTextField")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected row \(indexPath.row)")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // replace with array length
    }
    
    // MARK: UITableView Datasource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel.text = "Cell \(indexPath.row)"
        return cell
    }
}

