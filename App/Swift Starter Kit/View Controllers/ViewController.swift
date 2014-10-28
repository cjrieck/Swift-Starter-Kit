//
//  ViewController.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    weak var classTableView: UITableView!
    let classTableViewDataSource: SKViewControllerDataSource!
    
    init(title: String!) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        
        classTableViewDataSource = SKViewControllerDataSource()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.autoresizesSubviews = true
        
        let viewHeight = CGRectGetHeight(self.view.frame)
        let viewWidth = CGRectGetWidth(self.view.frame)
        
        var classTableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        classTableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        classTableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        classTableView.delegate = self
        classTableViewDataSource.dataTableView = classTableView
        classTableView.dataSource = classTableViewDataSource
        self.view.addSubview(classTableView)
        self.classTableView = classTableView
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
        var detailVC = DetailViewController(details: classTableViewDataSource.dataForIndexPath(indexPath))
        self.navigationController!.pushViewController(detailVC, animated: true)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

