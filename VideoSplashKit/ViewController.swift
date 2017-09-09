//
//  ViewController.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/3/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    
    override var prefersStatusBarHidden:Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "test", ofType: "mp4") {
            let url = URL(fileURLWithPath: path)
            videoFrame = view.frame
            fillMode = .resizeAspectFill
            alwaysRepeat = true
            sound = true
            startTime = 12.0
            duration = 4.0
            alpha = 0.7
            backgroundColor = UIColor.black
            contentURL = url
        }
        
        // Sample UI
        var sampleButton = UIButton(frame: CGRect(x: 15.0, y: 500.0, width: 140.0, height: 42.0))
        sampleButton.setImage(UIImage(named: "btnSignin"), for: .normal)
        sampleButton.layer.cornerRadius = 2
        sampleButton.layer.masksToBounds = true
        view.addSubview(sampleButton)
        
        sampleButton = UIButton(frame: CGRect(x: 165.0, y: 500.0, width: 140.0, height: 42.0))
        sampleButton.setImage(UIImage(named: "btnRegister"), for: .normal)
        sampleButton.layer.cornerRadius = 2
        sampleButton.layer.masksToBounds = true
        view.addSubview(sampleButton)
        
        let text = UILabel(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 100.0))
        text.font = UIFont(name: "Museo500-Regular", size: 30)
        text.textAlignment = .center
        text.textColor = UIColor.white
        text.text = "VideoSplash"
        view.addSubview(text)
    }
}
