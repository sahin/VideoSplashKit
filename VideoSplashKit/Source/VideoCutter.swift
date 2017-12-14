//
//  VideoCutter.swift
//  VideoSplash
//
//  Created by Toygar Dündaralp on 8/3/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString { return (self as NSString) }
}

public class VideoCutter: NSObject {
    
    /**
     Block based method for crop video url
     
     @param videoUrl Video url
     @param startTime The starting point of the video segments
     @param duration Total time, video length
     
     */
    public func cropVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath:URL?, _ error: NSError?) -> Void)?) {
        
        DispatchQueue.global().async {
            
            let asset = AVURLAsset(url: url, options: nil)
            let outputPath = NSTemporaryDirectory()
            let fileManager = FileManager.default
            
            guard let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality") else { return }
            let outputFilePath = outputPath.convert.appendingPathComponent("output.mp4")
            
            if fileManager.fileExists(atPath: outputFilePath) {
                do {
                    try fileManager.removeItem(atPath: outputFilePath)
                } catch let error {
                    print(error)
                }
            }
            
            do {
                try fileManager.createDirectory(atPath:outputPath, withIntermediateDirectories: true, attributes: nil) }
            catch let error {
                print(error)
            }
            
            let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
            let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
            let range = CMTimeRangeMake(start, duration)
            let outputURL = URL(fileURLWithPath: outputFilePath)
            exportSession.outputURL = outputURL
            exportSession.timeRange = range
            exportSession.shouldOptimizeForNetworkUse = true
            exportSession.outputFileType = AVFileType.mp4
            exportSession.exportAsynchronously(completionHandler: {
                switch exportSession.status {
                case .completed:
                    DispatchQueue.main.async { completion?(exportSession.outputURL, nil) }
                default:
                    DispatchQueue.main.async { completion?(nil, nil) }
                }
            })
        }
    }
}
