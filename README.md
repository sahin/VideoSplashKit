
[![Build Status](https://travis-ci.org/toygard/VideoSplash.svg)](https://travis-ci.org/toygard/VideoSplash) ![Gitter](https://img.shields.io/badge/license-MIT-blue.svg)
# VideoSplash - Video based UIViewController
![alt tag](http://oi57.tinypic.com/e5hi82.jpg)
##Introduction

__Requires iOS 8 or later and Xcode 7.0+__

##Installation

To install via CocoaPods add this line to your `Podfile`.

```
use_frameworks!

pod "VideoSplash"
```

Then, run the following command:

```$ pod install```

##Usage

```swift
import VideoSplash

class ViewController: VideoSplashViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test", ofType: "mp4")!)!
    self.videoFrame = view.frame
    self.fillMode = .AspectFill
    self.alwaysRepeat = true
    self.startTime = 11.0
    self.duration = 4.0
    self.alpha = 0.7
    self.backgroundColor = UIColor.blackColor()
    self.contentURL = url
  }
}
```
