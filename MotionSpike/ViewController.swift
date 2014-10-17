//
//  ViewController.swift
//  MotionSpike
//
//  Created by twer on 10/9/14.
//  Copyright (c) 2014 iKerry. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var gravityX: UILabel!
    @IBOutlet weak var gravityY: UILabel!
    @IBOutlet weak var gravityZ: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    let deviceMotionInterval = 0.1
//    let π = 3.1415926
    
    var startTime: Double = 0.0
    var timer: NSTimer!
    var gravityYValue: Double = 0.0
    var isStartGame: Bool = false
    
    
    @IBAction func startGame(sender: AnyObject) {
        startTime = Double(NSDate().timeIntervalSince1970)
        isStartGame = true
        updateUITime()
        timeLabel.text = "Time : "
        println("start time: \(startTime)" )
    }

    func updateUITime(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("check"), userInfo: nil, repeats: true)
    }
    
    func check(){
        
        if  abs(gravityYValue) < 0.1 {
            println("End motion value is : \(gravityYValue)")
            isStartGame = false
            timeLabel.text = "Cost Time is : \(Double(NSDate().timeIntervalSince1970) - startTime)"
            timer.invalidate()
        }
        
    }
    
    func motionOpen(){
        let motionManager: CMMotionManager = CMMotionManager()
        motionManager.startDeviceMotionUpdates()
        motionManager.deviceMotionUpdateInterval = deviceMotionInterval
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(),
            withHandler:{
                deviceManager,
                error in
                
                if error != nil {
                    motionManager.stopDeviceMotionUpdates()
                    return
                }
                
                if let deviceMotion = motionManager.deviceMotion {
                    var deviceGravityData = motionManager.deviceMotion.gravity
                    
                    if self.isStartGame {
                        self.gravityYValue = deviceGravityData.y
                    }
                    
                    self.gravityX.text = "gravityX  : \(deviceGravityData.x)"
                    self.gravityY.text = "gravityY : \(deviceGravityData.y)"
                    self.gravityZ.text = "gravityZ : \(deviceGravityData.z)"
                }
                
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionOpen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

