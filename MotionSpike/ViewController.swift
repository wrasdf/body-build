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

    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var RollLabel: UILabel!
    @IBOutlet weak var yawLabel: UILabel!
    
    @IBOutlet weak var accXLabel: UILabel!
    @IBOutlet weak var accYLabel: UILabel!
    @IBOutlet weak var accZlabel: UILabel!

    @IBOutlet weak var gyroX: UILabel!
    @IBOutlet weak var gyroY: UILabel!
    @IBOutlet weak var gyroZ: UILabel!
    
    
    
    let deviceMotionInterval = 0.1
//    let accelerometerInterval = 0.01
//    let gyroscopeInterval = 0.5;
    
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
                    
                    var deviceMotionData = motionManager.deviceMotion.attitude
                    self.pitchLabel.text = "Pitch : \(deviceMotionData.pitch)"
                    self.RollLabel.text = "Roll : \(deviceMotionData.roll)"
                    self.yawLabel.text = "Yaw : \(deviceMotionData.yaw)"
                    
                    var deviceAccelData = motionManager.deviceMotion.userAcceleration
                    self.accXLabel.text = "AccX : \(deviceAccelData.x)"
                    self.accYLabel.text = "AccY : \(deviceAccelData.y)"
                    self.accZlabel.text = "AccZ : \(deviceAccelData.z)"
                    
                    var deviceRotaionData = motionManager.deviceMotion.rotationRate
                    self.gyroX.text = "Gyroscope X  : \(deviceRotaionData.x)"
                    self.gyroY.text = "Gyroscope Y : \(deviceRotaionData.y)"
                    self.gyroZ.text = "Gyroscope Z : \(deviceRotaionData.z)"
                    
                }

        })
        
//        if (motionManager.gyroAvailable) {
//        
//            motionManager.gyroUpdateInterval = gyroscopeInterval
//            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {
//                (gyroData, error) in
//                
//                if error != nil {
//                    motionManager.stopGyroUpdates()
//                    return
//                }
//                
//                gyroData.rotationRate
//                self.gyroX.text = "AccX : \(gyroData.rotationRate.x)"
//                self.gyroY.text = "AccY : \(gyroData.rotationRate.y)"
//                self.gyroZ.text = "AccZ : \(gyroData.rotationRate.z)"
//
//                
//            })
//            
//        }
        
        
        
//        if (motionManager.accelerometerAvailable) {
//            motionManager.accelerometerUpdateInterval = accelerometerInterval
//            
//            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue()) {
//                (data, error) in
//                
//                if error != nil {
//                    motionManager.stopAccelerometerUpdates()
//                    return
//                }
//                
//                self.accXLabel.text = "AccX : \(data.acceleration.x)"
//                self.accYLabel.text = "AccY : \(data.acceleration.y)"
//                self.accZlabel.text = "AccZ : \(data.acceleration.z)"
//                
//            }
//        }
        
        
        

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

