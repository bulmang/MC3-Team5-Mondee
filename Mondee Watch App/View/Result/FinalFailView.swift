//
//  FinalFailView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/18.
//

import SwiftUI

struct FinalFailView: View {    
    @StateObject private var gameState = GameStateManager()
    @StateObject private var movingDetector = MovingDetector()
    
    private let deviceCommunicator = DeviceCommunicator()
        
    var body: some View {
        VStack{
            Image("ImgFail-WatchOS")
                .resizable()
                .frame(width: 76,height: 75)
            Text("내일은 성공해봐요!")
                .font(.body)
                .fontWeight(.medium)
                .padding(.top,20)
        }
        .padding(.top,20)
        .onAppear{
            gameState.isFinalFailActive = true
            gameState.checkIfNewDay()
            
            // 데이터를 보냅니다
            sendData()
        }
    }
    
    fileprivate func sendData() {
        deviceCommunicator.sendMessage(key: .isSuccess, message: false) { error in }
        deviceCommunicator.sendMessage(key: .gamePlayDate, message: Date()) { error in }
        
        deviceCommunicator.sendMessage(key: .isRetry, message: gameState.isRetry) { error in }
        deviceCommunicator.sendMessage(key: .totalDistanceMoved, message: movingDetector.totalDistanceMoved) { error in }
    }
}

struct FinalFailView_Previews: PreviewProvider {
    static var previews: some View {
        FinalFailView()
    }
}
