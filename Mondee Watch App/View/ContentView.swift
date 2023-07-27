//
//  ContentView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameState = GameStateManager()
    
    var body: some View {
        GameView()
            .onAppear{
                gameState.checkIfNewDay()
            }
//        Button("Send to Phone") {
//            gameState.watchDataModel.session.transferUserInfo(["GameSuccess":gameState.watchDataModel.isSuccess,"GameFail":gameState.watchDataModel.isFail, "GamePlayTime":gameState.watchDataModel.gamePlayTime, "GameDate":gameState.watchDataModel.gameDate, "RemainHeart":gameState.watchDataModel.remainHeart, "GameRetry":gameState.watchDataModel.isRetry])
//            print("눌림")
//        } .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
