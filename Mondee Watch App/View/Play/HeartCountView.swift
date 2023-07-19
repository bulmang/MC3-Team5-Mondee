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
            HStack {
                ForEach(0..<gameState.heartCount, id: \.self) { number in
                    Image("ImgHeart-WatchOS")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26)
                }
                ForEach(0..<(Constants.initialHeartCount - gameState.heartCount), id: \.self) { number in
                    Image("ImgHeartClear-WatchOS")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26)
                }
                Spacer()
            }
            Spacer()
        }.padding(.all, CGFloat(12))
    }
}
