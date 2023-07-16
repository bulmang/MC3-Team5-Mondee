//
//  GuideView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import SwiftUI

struct GuideView: View {
    @Binding var gameStatus: GameStatus
    @State var countDownView = false
    
    var body: some View{
        if countDownView {
            CountDownView(gameStatus: $gameStatus)
        } else {
            VStack {
                Image(systemName: "gamecontroller.fill")
                    .font(.largeTitle)
                Text("가이드를 주세영")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            countDownView = true
                        }
                    }
            }
        }
    }
}
