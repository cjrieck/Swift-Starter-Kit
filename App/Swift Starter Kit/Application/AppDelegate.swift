//
//  AppDelegate.swift
//  Swift Starter Kit
//
//  Created by Clayton Rieck on 10/28/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // app delegate properties MUST be optional unless it has a value during initialization or is lazily resolved
    var window: UIWindow?
    var navController: UINavigationController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // create a window the size of the screen of the device via the mainScreen singleton
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // create basic view controller to be the root
        var rootVC = ViewController(title: "My Title")
        rootVC.view.backgroundColor = UIColor.whiteColor()
        
        // set up nav controller to control app navigation with previously made view controller as its root
        navController = UINavigationController(rootViewController: rootVC)
        
        // set the nav controller as the rootViewController on the window
        window!.rootViewController = navController // be careful when force unwrapping an optional. Only do if you're 100% sure there's a value associated with the object
        window!.makeKeyAndVisible()
        return true
    }

    // app delegate state/lifecycle methods. ere just for reference. Usually, we'd delete if not being implemented
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

