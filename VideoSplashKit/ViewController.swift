//
//  ViewController.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/3/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test", ofType: "mp4")!)
    self.videoFrame = view.frame
    self.fillMode = .ResizeAspectFill
    self.alwaysRepeat = true
    self.sound = true
    self.startTime = 12.0
    self.duration = 4.0
    self.alpha = 0.7
    self.backgroundColor = UIColor.blackColor()
    self.contentURL = url

    // Sample UI
    var sampleButton = UIButton(frame: CGRect(x: 15.0, y: 500.0, width: 140.0, height: 42.0))
    sampleButton.setImage(UIImage(named: "btnSignin"), forState: .Normal)
    sampleButton.layer.cornerRadius = 2
    sampleButton.layer.masksToBounds = true
    view.addSubview(sampleButton)

    sampleButton = UIButton(frame: CGRect(x: 165.0, y: 500.0, width: 140.0, height: 42.0))
    sampleButton.setImage(UIImage(named: "btnRegister"), forState: .Normal)
    sampleButton.layer.cornerRadius = 2
    sampleButton.layer.masksToBounds = true
    view.addSubview(sampleButton)

    let text = UILabel(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 100.0))
    text.font = UIFont(name: "Museo500-Regular", size: 30)
    text.textAlignment = NSTextAlignment.Center
    text.textColor = UIColor.whiteColor()
    text.text = "VideoSplash"
    view.addSubview(text)
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}
