//
//  VideoSplashViewController.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/3/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

open class VideoSplashViewController: UIViewController {
    
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel: Float = 1.0
    
    open var videoFrame: CGRect = CGRect()
    open var startTime: CGFloat = 0.0
    open var duration: CGFloat = 0.0
    open var backgroundColor = UIColor.black { didSet { view.backgroundColor = backgroundColor } }
    open var contentURL: URL = URL(fileURLWithPath: "") { didSet { setMoviePlayer(url: contentURL) } }
    open var sound: Bool = true { didSet { moviePlayerSoundLevel = sound ? 1 : 0 } }
    open var alpha: CGFloat = 1 { didSet { moviePlayer.view.alpha = alpha } }
    
    open var alwaysRepeat: Bool = true {
        
        didSet {
            
            if alwaysRepeat {
                NotificationCenter.default.addObserver(forName:.AVPlayerItemDidPlayToEndTime, object:nil, queue:nil) { [weak self] (notification) in
                    self?.playerItemDidReachEnd()
                }
                return
            }
            
            if !alwaysRepeat {
                NotificationCenter.default.removeObserver(self, name:.AVPlayerItemDidPlayToEndTime, object: nil)
            }
        }
    }
    
    open var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize.rawValue
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            }
        }
    }
    
    open var restartForeground: Bool = false {
        didSet {
            if restartForeground {
                NotificationCenter.default.addObserver(forName:.UIApplicationWillEnterForeground, object:nil, queue:nil) { [weak self] (notification) in
                    self?.playerItemDidReachEnd()
                }
            }
        }
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.view.backgroundColor = self.backgroundColor;
        moviePlayer.showsPlaybackControls = false
        moviePlayer.view.isUserInteractionEnabled = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    private func setMoviePlayer(url: URL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { [weak self] (videoPath, error) -> Void in
            guard let path = videoPath, let strongSelf = self else { return }
            strongSelf.moviePlayer.player = AVPlayer(url: path)
            strongSelf.moviePlayer.player?.addObserver(strongSelf, forKeyPath: "status", options: .new, context: nil)
            strongSelf.moviePlayer.player?.play()
            strongSelf.moviePlayer.player?.volume = strongSelf.moviePlayerSoundLevel
        }
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let player = object as? AVPlayer else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        if player.status == .readyToPlay {
            movieReadyToPlay()
        }
    }
    
    deinit{
        moviePlayer.player?.removeObserver(self, forKeyPath: "status")
        NotificationCenter.default.removeObserver(self)
    }
    
    // Override in subclass
    open func movieReadyToPlay() { }
    
    func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }
    
    func playVideo() {
        moviePlayer.player?.play()
    }
    
    func pauseVideo() {
        moviePlayer.player?.pause()
    }
}
