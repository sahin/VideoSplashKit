//
//  VideoSplashViewController.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/3/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit
import MediaPlayer

enum ScalingMode {
  case AspectFill
  case AspectFit
  case Fill
  case None
}

class VideoSplashViewController: UIViewController {

  private let moviePlayer = MPMoviePlayerController()
  var contentURL: NSURL = NSURL() {
    didSet {
      setMoviePlayer(contentURL)
    }
  }

  var videoFrame: CGRect = CGRect()
  var startTime: CGFloat = 0.0
  var duration: CGFloat = 0.0
  var backgroundColor: UIColor = UIColor.blackColor() {
    didSet {
      view.backgroundColor = backgroundColor
    }
  }
  var alpha: CGFloat = CGFloat() {
    didSet {
      moviePlayer.view.alpha = alpha
    }
  }
  var alwaysRepeat: Bool = true {
    didSet {
      if alwaysRepeat {
        moviePlayer.repeatMode = MPMovieRepeatMode.One
      }else{
        moviePlayer.repeatMode = MPMovieRepeatMode.None
      }
    }
  }
  var fillMode: ScalingMode = .AspectFill {
    didSet {
      switch fillMode {
      case .AspectFill:
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
      case .AspectFit:
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFit
      case .Fill:
        moviePlayer.scalingMode = MPMovieScalingMode.Fill
      case .None:
        moviePlayer.scalingMode = MPMovieScalingMode.None
      default:
        moviePlayer.scalingMode = MPMovieScalingMode.None
      }
    }
  }

  override func viewDidAppear(animated: Bool) {
    moviePlayer.view.frame = videoFrame
    moviePlayer.controlStyle = MPMovieControlStyle.None
    moviePlayer.movieSourceType = MPMovieSourceType.File
    view.addSubview(moviePlayer.view)
    view.sendSubviewToBack(moviePlayer.view)
  }

  private func setMoviePlayer(url: NSURL){
    let videoCutter = VideoCutter()
    videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
      if let path = videoPath as NSURL? {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
          dispatch_async(dispatch_get_main_queue()) {
            self.moviePlayer.contentURL = path
            self.moviePlayer.play()
          }
        }
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
