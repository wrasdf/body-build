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
    
    @IBOutlet weak var gravityX: UILabel!
    @IBOutlet weak var gravityY: UILabel!
    @IBOutlet weak var gravityZ: UILabel!
    
    let deviceMotionInterval = 0.1
    let π = 3.1415926
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    self.gravityX.text = "gravityX  : \(deviceGravityData.x)"
                    self.gravityY.text = "gravityY : \(deviceGravityData.y)"
                    self.gravityZ.text = "gravityZ : \(deviceGravityData.z)"
                    
                }

        })
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

