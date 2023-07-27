//
//  WatchLiveDataModel.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/28.
//

import Foundation
import WatchConnectivity

class WatchLiveDataModel : NSObject, WCSessionDelegate, ObservableObject {
    static let shared = WatchLiveDataModel()
    let session = WCSession.default
    
    @Published var gameStart : Bool = false
    @Published var gamePause : Bool = false
    @Published var gameEnd : Bool = false
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
}
