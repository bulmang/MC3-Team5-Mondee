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
    @Published var totalDistanceMoved = 0.0
    
    private var startTime: Date?
    
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
                    self.isMoving = self.distanceMoved > self.distanceLimit
                    
                    // 시작 시간을 설정
                    if self.startTime == nil {
                        self.startTime = Date()
                    }
                    
                    // 현재 시간과 시작 시간 사이의 경과 시간을 계산
                    if let startTime = self.startTime {
                        let currentTime = Date()
                        let elapsedTime = currentTime.timeIntervalSince(startTime)
                        
                        if elapsedTime >= self.timeInterval {
                            // 경과 시간 동안의 이동 거리를 더해줌
                            self.totalDistanceMoved += self.distanceMoved
                            
                            // 시작 시간을 현재 시간으로 업데이트
                            self.startTime = currentTime
                        }
                    }
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    /// 0.5 * 가속도 * 시간의 제곱 * 중력 가속도로 이동거리를 구하는 함수
    private func calculateDistance(_ x: Double, _ y: Double, _ z: Double) -> Double {
        // 가속도 값(x, y, z)의 크기를 계산
        let accelerationMagnitude = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))
        
        // 이동거리를 계산하는 공식을 사용하여 이동거리 계산
        // 0.5 * 가속도 * 시간의 제곱 * 중력 가속도
        let distance = 0.5 * accelerationMagnitude * pow(timeInterval, 2) * 9.8
        
        return distance
    }
}
