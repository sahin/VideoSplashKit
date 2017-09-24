//
//  AppDelegate.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/4/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let viewController = ViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = viewController
        window!.backgroundColor = UIColor.white
        window!.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        viewController.pauseVideo()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        viewController.playVideo()
    }
}
