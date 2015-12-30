
[![Build Status](https://travis-ci.org/movielala/VideoSplashKit.svg)](https://travis-ci.org/movielala/VideoSplashKit) ![Gitter](https://img.shields.io/badge/license-MIT-blue.svg)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/movielala/VideoSplashKit?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
# VideoSplashKit - Video based UIViewController
![alt tag](http://oi57.tinypic.com/e5hi82.jpg)
##Introduction

__Requires iOS 8 or later and Xcode 6.1+__<br/>
 Swift support uses dynamic frameworks and is therefore only supported on iOS > 8.

##Installation

To install via CocoaPods add this line to your `Podfile`.

```
use_frameworks!
```
and
```
pod 'VideoSplashKit'
```

Then, run the following command:

```$ pod install```

##Usage

```swift
import VideoSplashKit

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
    self.restartForeground = true
  }
}
```
