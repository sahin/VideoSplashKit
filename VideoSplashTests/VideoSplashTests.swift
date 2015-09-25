//
//  VideoSplashTests.swift
//  VideoSplashTests
//
//  Created by Toygar Dündaralp on 8/4/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit
import XCTest
import VideoSplash

class VideoSplashTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testVideoCut(){
    let expectation = expectationWithDescription("VideoCutter")
    let videoCutter = VideoCutter()
    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test", ofType: "mp4")!)
    videoCutter.cropVideoWithUrl(videoUrl: url, startTime: 11.0, duration: 1.0) { (videoPath, error) -> Void in
      if let path = videoPath as NSURL? {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
          dispatch_async(dispatch_get_main_queue()) {
            XCTAssertNotNil(path, "video cut has failed")
            expectation.fulfill()
          }
        }
      }
    }
    self.waitForExpectationsWithTimeout(5.0, handler: nil)
  }

}
