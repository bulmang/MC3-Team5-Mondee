//
//  SuccessView.swift
//  Mondee Watch App
//
//  Created by woozu on 2023/07/14.
//

import SwiftUI

struct SuccessView: View {
    @StateObject private var gameState = GameStateManager()
    @StateObject private var movingDetector = MovingDetector()

    private let deviceCommunicator = DeviceCommunicator()

    var body: some View {
        VStack{
            ZStack{
                Image("ImgSuccess-WatchOS")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(.bottom,40)
                Text("오늘의 먼지")
                    .font(.body)
                    .fontWeight(.medium)
                    .padding(.top,90)
                
                Text("어플에서 확인해보세요")
                    .font(.body)
                    .fontWeight(.medium)
                    .padding(.top,125)
            }
        }
        .onAppear{
            gameState.isSuccessActive = true
            gameState.checkIfNewDay()
            
            // 데이터를 보냅니다
            sendData()
        }
    }
    
    fileprivate func sendData() {
        deviceCommunicator.sendMessage(key: .isSuccess, message: true) { error in }
        deviceCommunicator.sendMessage(key: .gamePlayDate, message: Date()) { error in }
        
        deviceCommunicator.sendMessage(key: .isRetry, message: gameState.isRetry) { error in }
        deviceCommunicator.sendMessage(key: .totalDistanceMoved, message: movingDetector.totalDistanceMoved) { error in }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
