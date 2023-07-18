//
//  GameStateManager.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import Foundation
import WatchKit

class GameStateManager: ObservableObject {
    private var movingDetector = MovingDetector()
    private var motionlessSeconds = 0
    private var movingSeconds = 0
    private var timer: Timer?
    
    @Published var heartCount = Constants.initialHeartCount
    @Published var remainingSeconds = Constants.initialSeconds
    @Published var isCharacterClean = true
    @Published var isCharacterBubbling = false
    @Published var isGameFinished = false
    @Published var isGameSuccessful = false
    @Published var isWarning = false
    
    func playGame() {
        SessionExtend.shared.startSession()
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if !self.movingDetector.isMoving {
                    self.isCharacterBubbling = false
                    self.motionlessSeconds += 1
                    self.movingSeconds = 0
                } else {
                    self.isCharacterBubbling = true
                    self.motionlessSeconds = 0
                    self.movingSeconds += 1
                }
                if self.motionlessSeconds >= Constants.motionlessThreshold1 && self.motionlessSeconds < Constants.motionlessThreshold2 {
                    self.isWarning = true
                    WKInterfaceDevice.current().play(.notification)
                } else {
                    self.isWarning = false
                }
                if self.motionlessSeconds >= Constants.motionlessThreshold2 {
                    self.isCharacterClean = false
                    self.heartCount -= 1
                    self.motionlessSeconds = 0
                    if (self.heartCount == 0) {
                        self.gameFail()
                    }
                }
                if self.movingSeconds >= Constants.movingThreshold {
                    self.isCharacterClean = true
                }
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    self.gameSuccess()
                }
            }
        }
    }
    
    private func gameSuccess() {
        isGameSuccessful = true
        gameStop()
        print("success")
    }
    
    private func gameFail() {
        isGameSuccessful = false
        gameStop()
        print("fail")
    }
    
    private func gameStop() {
        movingDetector.stopMotionUpdates()
        timer?.invalidate()
        timer = nil
        remainingSeconds = Constants.initialSeconds
        isGameFinished = true
    }
}
