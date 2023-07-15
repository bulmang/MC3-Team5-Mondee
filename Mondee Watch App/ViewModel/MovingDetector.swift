//
//  MovingDetector.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import CoreMotion
import Combine

class MovingDetector: ObservableObject {
    private let motionManager = CMMotionManager()
    private let timeInterval = 0.3
    private let distanceLimit = 0.05
    
    @Published var isMoving = false
    @Published var distanceMoved = 0.0
    
    init() {
        startMotionUpdates()
    }
    
    private func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = timeInterval
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { motion, error in
                guard let motion = motion else {
                    return
                }
                
                let accelerationX = motion.userAcceleration.x
                let accelerationY = motion.userAcceleration.y
                let accelerationZ = motion.userAcceleration.z
                print("run", Date())
                self.distanceMoved = self.calculateDistance(accelerationX, accelerationY, accelerationZ)
                
                DispatchQueue.main.async { [self] in
                    self.isMoving = self.distanceMoved > self.distanceLimit
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    private func calculateDistance(_ x: Double, _ y: Double, _ z: Double) -> Double {
        sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2)) * 0.5 * pow(self.timeInterval, 2) * 9.8
    }
}
