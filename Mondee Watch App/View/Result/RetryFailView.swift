//
//  FailView.swift
//  Mondee Watch App
//
//  Created by woozu on 2023/07/14.
//

import SwiftUI

struct RetryFailView: View {
    
    @ObservedObject var gameState = GameStateManager()
    
    @Binding var isFinalFail: Bool
    @Binding var gameStatus: GameStatus
    
    
    var body: some View {
        VStack{
            Image("ImgFail-WatchOS")
                .resizable()
                .scaledToFit()
                .frame(width: 75,height: 75)
                
            Text("더 씻겨주세요")
                .font(.body)
                .fontWeight(.medium)
            Button("다시 도전"){
                gameStatus = .guide
                gameState.watchDataModel.isRetry = true
                gameState.watchDataModel.remainHeart = 3
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(hue: 0.593, saturation: 0.893, brightness: 0.876, opacity: 0.827))
            
            Button("오늘은 그만"){
                isFinalFail = true
                sendData()
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    private func sendData() {
        gameState.watchDataModel.isFail = true
        gameState.watchDataModel.session.transferUserInfo(["GameSuccess":gameState.watchDataModel.isSuccess,"GameFail":gameState.watchDataModel.isFail, "GamePlayTime":gameState.watchDataModel.gamePlayTime, "GameDate":gameState.watchDataModel.gameDate, "RemainHeart":gameState.watchDataModel.remainHeart, "GameRetry":gameState.watchDataModel.isRetry])
        print("데이터 전송")
    }

}


struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        RetryFailView(isFinalFail: .constant(false), gameStatus: .constant(.fail))
    }
}
