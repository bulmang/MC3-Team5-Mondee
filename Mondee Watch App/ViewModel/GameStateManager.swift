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
    private var isPaused = false
    
    @Published var heartCount = Constants.initialHeartCount
    @Published var remainingSeconds = Constants.initialSeconds
    @Published var isCharacterClean = true
    @Published var isCharacterBubbling = false
    @Published var isGameFinished = false
    @Published var isGameSuccessful = false
    @Published var isSemiWarning = false
    @Published var isWarning = false
    @Published var isEarlyTerminationPossible = false
    
    func playGame() {
        SessionExtend.shared.startSession()
        movingDetector.startMotionUpdates()
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if self.isGameFinished {
                    self.stopTimer()
                    return
                }
                if self.isPaused {
                    return
                }
                
                self.setIsEarlyTerminationPossible()
                
                if !self.movingDetector.isMoving {
                    self.isCharacterBubbling = false
                    self.motionlessSeconds += 1
                    self.movingSeconds = 0
                } else {
                    self.isCharacterBubbling = true
                    self.motionlessSeconds = 0
                    self.movingSeconds += 1
                }
                if self.motionlessSeconds >= Constants.semiWarningThreshold && self.motionlessSeconds < Constants.warningThreshold {
                    self.isSemiWarning = true
                } else {
                    self.isSemiWarning = false
                }
                if self.motionlessSeconds >= Constants.warningThreshold && self.motionlessSeconds < Constants.dirtThreshold {
                    self.isWarning = true
                    WKInterfaceDevice.current().play(.notification)
                } else {
                    self.isWarning = false
                }
                if self.motionlessSeconds >= Constants.dirtThreshold {
                    self.isCharacterClean = false
                    self.heartCount -= 1
                    self.motionlessSeconds = 0
                    if (self.heartCount == 0) {
                        self.failGame()
                    }
                }
                if self.movingSeconds >= Constants.cleanThreshold {
                    self.isCharacterClean = true
                }
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    self.successGame()
                }
            }
        }
    }
    
    func setIsEarlyTerminationPossible() {
        if remainingSeconds <= (Constants.initialSeconds - Constants.terminationPossibleSeconds) {
            isEarlyTerminationPossible = true
        }
    }
    
    func pauseGame() {
        isPaused = true
        movingDetector.stopMotionUpdates()
        stopTimer()
    }
    
    func resumeGame() {
        isPaused = false
        movingDetector.startMotionUpdates()
        playGame()
    }
    
    func successGameEarly() {
        successGame()
    }
    
    func giveUpGame() {
        failGame()
    }
    
    private func successGame() {
        isGameSuccessful = true
        stopGame()
    }
    
    private func failGame() {
        isGameSuccessful = false
        stopGame()
    }
    
    private func stopGame() {
        SessionExtend.shared.stopSession()
        movingDetector.stopMotionUpdates()
        isGameFinished = true
        remainingSeconds = Constants.initialSeconds
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
