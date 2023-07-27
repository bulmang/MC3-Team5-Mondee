//
//  ContentView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameState = GameStateManager()
    
    @ObservedObject var data = WatchDataModel.shared
    
    var body: some View {
//        GameView()
//            .onAppear{
//                gameState.checkIfNewDay()
//            }
        Button("Send to Phone") {
            data.session.transferUserInfo(["GameSuccess":data.isSuccess, "GamePlayTime":data.gamePlayTime, "GameDate":data.gameDate, "RemainHeart":data.remainHeart, "GameRetry":data.isRetry, "GamePause": data.isPause])
        } .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
