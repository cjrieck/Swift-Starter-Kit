//
//  DetailViewController.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let detailText: String!
    
    init(details: String!) {
        super.init(nibName: nil, bundle: nil)
        // Do any custom initialization here
        self.detailText = details
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.autoresizesSubviews = true
        
        let viewWidth = CGRectGetWidth(self.view.frame)
        let viewHeight = CGRectGetHeight(self.view.frame)
        var detailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight/4))
        detailLabel.textAlignment = NSTextAlignment.Center
        detailLabel.center = self.view.center
        detailLabel.text = detailText
        self.view.addSubview(detailLabel)
    }
}
