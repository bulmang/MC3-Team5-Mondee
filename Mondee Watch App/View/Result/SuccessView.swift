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
    
    @ObservedObject var watchLiveDataModel = WatchLiveDataModel()
    
    @State private var counter: Int = 0
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text("청소 성공")
                .font(.title3)
                .bold()
                .offset(y: 20)
                .padding(.bottom, 10)
            ZStack{
                ConfettiCannon(counter: $counter, colors: [.blue, .teal, .blue, .red, .yellow], repetitions: 4, repetitionInterval: 0.3)
                Image("ImgSuccess-WatchOS")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(.bottom, 40)
                    .overlay {
                        Text("?")
                            .font(.system(size: 60))
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                            .padding(.bottom, 40)
                            .bubbleFontModifier()
                    }
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
            WKInterfaceDevice.current().play(.success)
            gameState.isSuccessActive = true
            gameState.checkIfNewDay()
            counter += 1
            
            watchLiveDataModel.gameEnd = true
            watchLiveDataModel.session.transferUserInfo(["GameEnd":watchLiveDataModel.gameEnd])
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
