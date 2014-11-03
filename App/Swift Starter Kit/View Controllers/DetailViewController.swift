//
//  DetailViewController.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let person: PersonModel
    
    init(selectedPerson person: PersonModel) {
        self.person = person
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor() // need to set this or everything will be transparent
        
        let viewWidth = CGRectGetWidth(self.view.frame)
        let viewHeight = CGRectGetHeight(self.view.frame)
        var detailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight/4))
        detailLabel.textAlignment = .Center
        detailLabel.center = self.view.center
        // w00t for autolayout!! This makes sure the label is always centered no matter what orientation
        detailLabel.autoresizingMask = .FlexibleWidth | .FlexibleHeight | .FlexibleTopMargin | .FlexibleBottomMargin | .FlexibleLeftMargin | .FlexibleRightMargin
        
        var personDescription = "First: \(self.person.firstName) Last: \(self.person.lastName)"
        if let personAge = self.person.age { // proper way to unwrap an optional. Remember, 'age' is optional on PersonModel so we HAVE to make this check
            personDescription += " Age: \(personAge)"
        }
        detailLabel.text = personDescription
        self.view.addSubview(detailLabel)
        
        // Just a brief note. Why don't we have a property on the DetailViewController for this UILabel? Because we don't access it/use it anywhere else
        // in this file. Properties should only be created if they're going to be called or used throughout a class. Usually, UI elements are not used throughout
        // a class. There are exceptions of course (a big one being IBOutlets if using nibs or a storyboard)
    }
}
