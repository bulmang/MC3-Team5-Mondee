//
//  MovingDetector.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import CoreMotion

class MovingDetector: ObservableObject {
    private let motionManager = CMMotionManager()
    private let timeInterval = 0.3
    private let distanceLimit = 0.05
    
    @Published var isMoving = false
    @Published var distanceMoved = 0.0
    
    func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = timeInterval
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { motion, error in
                guard let motion = motion else {
                    return
                }
                
                let accelerationX = motion.userAcceleration.x
                let accelerationY = motion.userAcceleration.y
                let accelerationZ = motion.userAcceleration.z
                self.distanceMoved = self.calculateDistance(accelerationX, accelerationY, accelerationZ)
                
                DispatchQueue.main.async { [self] in
                    
                    // TODO: 이 부분에 대한 주석이 필요
                    self.isMoving = self.distanceMoved > self.distanceLimit
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    // TODO: 추가 설명 필요
    /// 0.5 * 가속도 * 시간의 제곱이 이동거리라는 공식을 사용하여 이동거리를 구하는 함수
    private func calculateDistance(_ x: Double, _ y: Double, _ z: Double) -> Double {
        sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2)) * 0.5 * pow(self.timeInterval, 2) * 9.8
    }
}
