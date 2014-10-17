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
    
    @IBOutlet weak var gyroTestX: UILabel!
    @IBOutlet weak var gyroTestY: UILabel!
    @IBOutlet weak var gyroTestZ: UILabel!
    
    @IBOutlet weak var magnetometerLabelX: UILabel!
    @IBOutlet weak var magnetometerlabelY: UILabel!
    @IBOutlet weak var magnetometerlabelZ: UILabel!
    
    @IBOutlet weak var gravityX: UILabel!
    @IBOutlet weak var gravityY: UILabel!
    @IBOutlet weak var gravityZ: UILabel!
    
    let deviceMotionInterval = 0.1
//    let accelerometerInterval = 0.01
    let gyroscopeInterval = 0.1
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
                    
//                    var deviceMotionData = motionManager.deviceMotion.attitude
//                    self.pitchLabel.text = "Pitch : \(deviceMotionData.pitch*(180/self.π))"
//                    self.RollLabel.text = "Roll : \(deviceMotionData.roll*(180/self.π))"
//                    self.yawLabel.text = "Yaw : \(deviceMotionData.yaw*(180/self.π))"
//                    
//                    var deviceAccelData = motionManager.deviceMotion.userAcceleration
//                    self.accXLabel.text = "AccX : \(deviceAccelData.x)"
//                    self.accYLabel.text = "AccY : \(deviceAccelData.y)"
//                    self.accZlabel.text = "AccZ : \(deviceAccelData.z)"
//                    
//                    var deviceRotaionData = motionManager.deviceMotion.rotationRate
//                    self.gyroX.text = "Gyro X  : \(deviceRotaionData.x)"
//                    self.gyroY.text = "Gyro Y : \(deviceRotaionData.y)"
//                    self.gyroZ.text = "Gyro Z : \(deviceRotaionData.z)"

                    
                    var deviceGravityData = motionManager.deviceMotion.gravity
                    self.gravityX.text = "gravityX  : \(deviceGravityData.x)"
                    self.gravityY.text = "gravityY : \(deviceGravityData.y)"
                    self.gravityZ.text = "gravityZ : \(deviceGravityData.z)"
                    
                    
                    
                    // it not works
//                    var deviceMagnetometerData = motionManager.deviceMotion.magneticField.field
//                    self.magnetometerLabelX.text = "magnetometerX : \(deviceMagnetometerData.x)"
//                    self.magnetometerlabelY.text = "magnetometerY : \(deviceMagnetometerData.y)"
//                    self.magnetometerlabelZ.text = "magnetometerZ : \(deviceMagnetometerData.z)"
                    
                    
                }

        })
        
        if (motionManager.gyroAvailable) {
        
            motionManager.gyroUpdateInterval = gyroscopeInterval
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {
                (gyroData, error) in
                
                if error != nil {
                    motionManager.stopGyroUpdates()
                    return
                }
                
                gyroData.rotationRate
                self.gyroTestX.text = "gyroTestX : \(gyroData.rotationRate.x)"
                self.gyroTestY.text = "gyroTestY : \(gyroData.rotationRate.y)"
                self.gyroTestZ.text = "gyroTestZ : \(gyroData.rotationRate.z)"
                
            })
            
        }
        
        
        
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
        
        
        
        motionManager.magnetometerUpdateInterval  = 1.0/10.0; // Update at 10Hz
        if (motionManager.magnetometerAvailable) {
            motionManager.startMagnetometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {
                (data, error) in
                
                var deviceMagnetometerData = data.magneticField
                self.magnetometerLabelX.text = "magnetometerX : \(deviceMagnetometerData.x)"
                self.magnetometerlabelY.text = "magnetometerY : \(deviceMagnetometerData.y)"
                self.magnetometerlabelZ.text = "magnetometerZ : \(deviceMagnetometerData.z)"
                
            })
        }
        
        
        

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

