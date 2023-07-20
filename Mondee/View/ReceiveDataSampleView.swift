//
//  ReceiveDataSampleView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct ReceiveDataSampleView: View {
    
    private let deviceCommunicator = DeviceCommunicator()
    
    @State var success = false
    @State var gameDate = Date()
    
    @State var start = false
    @State var pause = false
    
    @State var isRetry = false
    @State var gamePlayTime = 0
    @State var remainingHeartCount = 0
    @State var totalDistanceMoved = 0
        
    var body: some View {
        NavigationStack {
            List {
                
                Section("중요 데이터") {
                    Text("success : \(success.description)")
                    Text("gameDate : \(gameDate.formatted(date: .abbreviated, time: .standard))")
                }
                
                Section("라이브 액티비티") {
                    Text("start : \(start.description)")
                    Text("pause : \(pause.description)")
                }
                
                Section("기타 데이터") {
                    Text("isRetry : \(isRetry.description)")
                    Text("gamePlayTime : \(gamePlayTime)")
                    Text("remainingHeartCount : \(remainingHeartCount)")
                    Text("totalDistanceMoved : \(totalDistanceMoved)")
                }
                .navigationTitle("Data Receive")
            }
        }
        .onAppear {
            deviceCommunicator.dataReceived = processReceivedData
        }
    }
    
    /// MessageKey enum 케이스 별로 알맞은 타입 값으로 변경
    fileprivate func processReceivedData(key: MessageKey, value: Any) {
        switch key {
        case .isSuccess:
            if let boolValue = value as? Bool {
                success = boolValue
            }
        case .gamePlayDate:
            if let dateValue = value as? Date {
                gameDate = dateValue
            }
        case .isRetry:
            if let boolValue = value as? Bool {
                isRetry = boolValue
            }
        case .remainingHeartCount:
            if let intValue = value as? Int {
                remainingHeartCount = intValue
            }
        case .gamePlayTime:
            if let intValue = value as? Int {
                gamePlayTime = intValue
            }
        case .totalDistanceMoved:
            if let intValue = value as? Int {
                totalDistanceMoved = intValue
            }
        case .gameStart:
            if let boolValue = value as? Bool {
                start = boolValue
            }
        case .gamePause:
            if let boolValue = value as? Bool {
                pause = boolValue
            }
        }
    }
}

struct ReceiveDataSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveDataSampleView()
    }
}
