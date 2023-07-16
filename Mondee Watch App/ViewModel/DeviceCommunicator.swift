//
//  DeviceCommunicator.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/15.
//

import Foundation
import WatchConnectivity

/// Two-way communication between an iOS app and its paired watchOS app.
/// 🚨 Message enum is required
class DeviceCommunicator: NSObject, WCSessionDelegate {
    private var session: WCSession = .default
    
    /// Data Recieved handler
    var dataReceived: ((MessageKey, Any) -> Void)?
    
    init(session: WCSession = .default) {
        self.session = session
        
        super.init()
        
        self.session.delegate = self
        self.connect()
    }
    
    /// Activates the session if WCSession is supported.
    private func connect() {
        guard WCSession.isSupported() else {
            print("WCSession is not supported")
            return
        }
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) { }
    
    func sessionDidDeactivate(_ session: WCSession) { }
#endif
    
    /// Handles the received message.
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        guard let dataReceived = self.dataReceived else {
            print("Data has been received, but there's no 'dataReceived' handler to process it.")
            return
        }
        
        DispatchQueue.main.async {
            message.forEach { key, value in
                if let messageKey = MessageKey(rawValue: key) {
                    dataReceived(messageKey, value)
                } else {
                    print("Received unknown message key: \(key)")
                }
            }
        }
    }
    
    
    /// Sends various types of messages(data) to another device.
    func sendMessage(key: MessageKey, message: Any, _ errorHandler: ((Error) -> Void)?) {
        if session.isReachable {
            session.sendMessage([key.rawValue : message], replyHandler: nil) { (error) in
                print(error.localizedDescription)
                if let errorHandler = errorHandler {
                    errorHandler(error)
                }
            }
        } else {
            print("Cannot send message. Session is not reachable.")
        }
    }
}

