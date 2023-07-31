//
//  WatchDataModel.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/27.
//

import Foundation
import WatchConnectivity

class WatchDataModel : NSObject, WCSessionDelegate, ObservableObject {
    static let shared = WatchDataModel()
    let session = WCSession.default
    
    @Published var isSuccess : Bool = false
    @Published var isFail : Bool = false
    @Published var gamePlayTime : Int = 0
    @Published var gameDate : Date = Date()
    @Published var remainHeart : Int = 3
    @Published var isRetry : Bool = false
    @Published var isStart : Bool = false
    @Published var isPaused : Bool = false
    
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
