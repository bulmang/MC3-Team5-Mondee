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
                ForEach(0..<Constants.initialHeartCount, id: \.self) { i in
                    Text("♥︎")
                        .font(.title3)
                        .bubbleFontModifier()
                        .opacity(i < gameState.heartCount ? 1 : 0.3)
                }
                Spacer()
            }
            Spacer()
        }
    }
}
