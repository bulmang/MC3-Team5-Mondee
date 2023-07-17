//
//  SessionExtend.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import WatchKit

class SessionExtend: NSObject, ObservableObject, WKExtendedRuntimeSessionDelegate {
    static public let shared = SessionExtend()
    
    private var session = WKExtendedRuntimeSession()
    
    private func isRunningSession() -> Bool {
        return session.state == .running || session.state == .scheduled
    }
    
    func startSession() {
        if isRunningSession() {
            return
        }
        
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start(at: Date())
    }
    
    func stopSession() {
        if isRunningSession() {
            session.invalidate()
        }
    }
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        print("extended runtime session")
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("extended runtime session did start")
    }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("extended runtime session will expire")
    }
}
