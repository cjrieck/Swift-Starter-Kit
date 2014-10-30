//
//  DetailViewController.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let person: PersonModel!
    
    init(selectedPerson person: PersonModel!) {
        super.init(nibName: nil, bundle: nil)
        // Do any custom initialization here
        self.person = person
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
        detailLabel.autoresizingMask = UIViewAutoresizing.FlexibleWidth |
                                       UIViewAutoresizing.FlexibleHeight |
                                       UIViewAutoresizing.FlexibleTopMargin |
                                       UIViewAutoresizing.FlexibleBottomMargin |
                                       UIViewAutoresizing.FlexibleLeftMargin |
                                       UIViewAutoresizing.FlexibleRightMargin
        
        var personDescription = "First: \(self.person.firstName) Last: \(self.person.lastName)"
        if let personAge = self.person.age {
            personDescription += " Age: \(personAge)"
        }
        detailLabel.text = personDescription
        self.view.addSubview(detailLabel)
    }
}
