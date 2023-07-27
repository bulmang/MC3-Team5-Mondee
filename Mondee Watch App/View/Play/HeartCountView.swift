//
//  HeartCountView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/19.
//

import SwiftUI

struct HeartCountView: View {
    @ObservedObject var gameState: GameStateManager
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<gameState.watchDataModel.remainHeart, id: \.self) { i in
                    Text("♥︎")
                        .font(.title3)
                        .bubbleFontModifier()
                        .opacity(i < gameState.watchDataModel.remainHeart ? 1 : 0.3)
                        .animation(.easeIn, value: gameState.watchDataModel.remainHeart)
                }
                Spacer()
            }
            Spacer()
        }
    }
}
