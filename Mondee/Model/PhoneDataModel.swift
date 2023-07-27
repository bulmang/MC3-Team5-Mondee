//
//  PhoneDataModel.swift
//  Mondee
//
//  Created by 하명관 on 2023/07/27.
//

import Foundation
import WatchConnectivity


class PhoneDataModel : NSObject, WCSessionDelegate, ObservableObject {
    static let shared = PhoneDataModel()
    
    let session = WCSession.default
    let userData = UserData()
    
    @Published var gameSuccess : Bool = false
    @Published var gamePlayTime : Int = 0
    @Published var gamePlayDate : Date = Date()
    @Published var remainingHeartCount : Int = 3
    @Published var gameRetry : Bool = false
    @Published var gamePause : Bool = false
    
    @Published var WatchGameUserData: [String] = []
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        } else {
            print("ERROR: Watch session not supported")
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("session activation failed with error: \(error.localizedDescription)")
            return
        }
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
        session.activate()
    }
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any]) {
        guard let newSuccess = userInfo["GameSuccess"] as? Bool,
              let newPlayTime = userInfo["GamePlayTime"] as? Int,
              let newDate = userInfo["GameDate"] as? Date,
              let newRemainHeart = userInfo["RemainHeart"] as? Int,
              let newRetry = userInfo["GameRetry"] as? Bool,
              let newPause = userInfo["GamePause"] as? Bool
                
        else{
            print("ERROR: unknown data received from Watch")
            return
        }
        DispatchQueue.main.async { [self] in
            self.gameSuccess = newSuccess
            self.gamePlayTime = newPlayTime
            self.gamePlayDate = newDate
            self.remainingHeartCount = newRemainHeart
            self.gameRetry = newRetry
            self.gamePause = newPause
            
            let dateString = self.dateFormatter.string(from: newDate) // 날짜를 문자열로 변환
            
            self.WatchGameUserData.append(String(newSuccess))
            self.WatchGameUserData.append(String(newPlayTime))
            self.WatchGameUserData.append(dateString)
            self.WatchGameUserData.append(String(newRemainHeart))
            self.WatchGameUserData.append(String(newRetry))
            self.WatchGameUserData.append(String(newPause))
            
            userData.save(WatchGameUserData)

        }
    }
}
