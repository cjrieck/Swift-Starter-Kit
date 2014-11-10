//
//  ViewController.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    // weak properties are ALWAYS optional (and it's best practice to make UI elements weak). 
    // Here, we're setting it to be implicitly unwrapped because 1) we know it'll be given a value in loadView and 2) so we don't have to unwrap it everytime we perform an operation on it
    weak var classTableView: UITableView!
    
    // This is NOT optional because we need this to populate the tableview being displayed.
    // Swift's compiler performs a 2 step initialization of objects and 4 safety checks. This is an example of safety check 1.
    // As quoted from Apple's documentation: “A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer.”
    let classTableViewDataSource: ViewControllerDataSource
    
    init(title: String!) {
        // Here, we initialize the datasource class property BEFORE super class initialization to pass the first safety check
        self.classTableViewDataSource = ViewControllerDataSource()
        super.init(nibName: nil, bundle: nil) // must call this since it is the designated initializer
        self.title = title // this is a property created in the initializer of the superclass which is why we can set it after the super.init call
    }
    
    // Required my Swift in custom initializations. This is the default implementation
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView() // always call the superclass' method when overriding built-in functionality
        
        let viewHeight = CGRectGetHeight(self.view.frame)
        let viewWidth = CGRectGetWidth(self.view.frame)
        
        var classTableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        classTableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        classTableView.delegate = self
        classTableViewDataSource.dataTableView = classTableView
        classTableView.dataSource = classTableViewDataSource
        self.view.addSubview(classTableView) // the view is now retaining this tableview for its (the view's) lifetime
        self.classTableView = classTableView // the weak property, classTableView, doesn't get deallocated because the view is referencing the local variable classTableView which is storng in this scope
    }
    
//    Comment out these methods if necessary. For code cleanliness, we omit code we do not need/use
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    // MARK: UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var detailVC = DetailViewController(selectedPerson: classTableViewDataSource.dataForIndexPath(indexPath))
        
        // remember, our navigation controller is an optional as defined in the app delegate so we need to force unwrap it
        // it's safe to do so since we know our navigationController property has a value
        self.navigationController!.pushViewController(detailVC, animated: true)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

