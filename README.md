
[![Build Status](https://travis-ci.org/movielala/VideoSplashKit.svg)](https://travis-ci.org/movielala/VideoSplashKit) ![Gitter](https://img.shields.io/badge/license-MIT-blue.svg)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/movielala/VideoSplashKit?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![CocoaPods](https://img.shields.io/cocoapods/v/VideoSplashKit.svg)](https://img.shields.io/cocoapods/v/VideoSplashKit.svg)

# VideoSplashKit - Video based UIViewController

![alt tag](http://oi57.tinypic.com/e5hi82.jpg)

## Introduction

__Requires iOS 8 or later and Xcode 6.1+__<br/>
 Swift support uses dynamic frameworks and is therefore only supported on iOS > 8.

## Installation

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

## Usage

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

## Authors
| [<img src="https://avatars1.githubusercontent.com/u/1448702?v=4" width="100px;"/>](http://okaris.com)   | [Omer Karisman](http://okaris.com)<br/><br/><sub>Lead UI/UX @ [MojiLaLa](http://mojilala.com)</sub><br/> [![Twitter][1.1]][1] [![Dribble][2.1]][2] [![Github][3.1]][3]| [<img src="https://pbs.twimg.com/profile_images/508440350495485952/U1VH52UZ_200x200.jpeg" width="100px;"/>](https://twitter.com/sahinboydas)   | [Sahin Boydas](https://twitter.com/sahinboydas)<br/><br/><sub>Co-Founder @ [MojiLaLa](http://mojilala.com)</sub><br/> [![LinkedIn][4.1]][4]|
| - | :- | - | :- |

[1.1]: http://i.imgur.com/wWzX9uB.png (twitter icon without padding)
[2.1]: http://i.imgur.com/Vvy3Kru.png (dribbble icon without padding)
[3.1]: http://i.imgur.com/9I6NRUm.png (github icon without padding)
[4.1]: https://www.kingsfund.org.uk/themes/custom/kingsfund/dist/img/svg/sprite-icon-linkedin.svg (linkedin icon)

[1]: http://www.twitter.com/okarisman
[2]: http://dribbble.com/okaris
[3]: http://www.github.com/okaris
[4]: https://www.linkedin.com/in/sahinboydas
