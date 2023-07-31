//
//  PhoneLiveDataModel.swift
//  Mondee
//
//  Created by 하명관 on 2023/07/28.
//

import Foundation
import WatchConnectivity


class PhoneLiveDataModel : NSObject, WCSessionDelegate, ObservableObject {
    static let shared = PhoneLiveDataModel()
    
    let session = WCSession.default
    let data = LiveData()
    
    @Published var gameStart : Bool = false
    @Published var gamePause : Bool = false
    @Published var remainHeartCount : Int = 3
    
    
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
        guard let newStart = userInfo["GameStart"] as? Bool,
              let newPause = userInfo["GamePause"] as? Bool,
              let newRemainHeartCount = userInfo["RemainHeartCount"] as? Int
                
        else{
            print("ERROR: unknown data received from Watch")
            return
        }
        DispatchQueue.main.async { [self] in
            self.gameStart = newStart
            self.gamePause = newPause
            self.remainHeartCount = newRemainHeartCount
            
            data.save(gameStart, gamePause, remainHeartCount)
        }
    }
}
