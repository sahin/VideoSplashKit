//
//  VideoCutter.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/3/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit
import AVFoundation

public class VideoCutter: NSObject {

  /**
  Block based method for crop video url
  
  @param videoUrl Video url
  @param startTime The starting point of the video segments
  @param duration Total time, video length

  */
  public func cropVideoWithUrl(videoUrl url: NSURL, startTime: CGFloat, duration: CGFloat, completion: ((videoPath: NSURL?, error: NSError?) -> Void)?) {
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    dispatch_async(dispatch_get_global_queue(priority, 0)) {
      let asset = AVURLAsset(URL: url, options: nil)
      let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
      var paths: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
      var outputURL = paths.objectAtIndex(0) as! String
      var manager = NSFileManager.defaultManager()
      manager.createDirectoryAtPath(outputURL, withIntermediateDirectories: true, attributes: nil, error: nil)
      outputURL = outputURL.stringByAppendingPathComponent("output.mp4")
      manager.removeItemAtPath(outputURL, error: nil)
      exportSession.outputURL = NSURL(fileURLWithPath: outputURL)
      exportSession.shouldOptimizeForNetworkUse = true
      exportSession.outputFileType = AVFileTypeMPEG4
      var start = CMTimeMakeWithSeconds(Float64(startTime), 600)
      var duration = CMTimeMakeWithSeconds(Float64(duration), 600)
      var range = CMTimeRangeMake(start, duration)
      exportSession.timeRange = range
      exportSession.exportAsynchronouslyWithCompletionHandler { () -> Void in
        switch exportSession.status {
        case AVAssetExportSessionStatus.Completed:
          completion?(videoPath: exportSession.outputURL, error: nil)
        case AVAssetExportSessionStatus.Failed:
          println("Failed: \(exportSession.error)")
        case AVAssetExportSessionStatus.Cancelled:
          println("Failed: \(exportSession.error)")
        default:
          println("default case")
        }
      }
      dispatch_async(dispatch_get_main_queue()) {
      }
    }
  }

}
