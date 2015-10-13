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
  
  func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window!.rootViewController = viewController
    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()
    return true
  }

  func applicationWillResignActive(application: UIApplication) {  }

  func applicationDidEnterBackground(application: UIApplication) {
    viewController.pauseVideo()
  }

  func applicationWillEnterForeground(application: UIApplication) {
    viewController.playVideo()
  }

  func applicationDidBecomeActive(application: UIApplication) { }

  func applicationWillTerminate(application: UIApplication) { }
}
