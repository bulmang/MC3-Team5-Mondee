//
//  GuideView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import SwiftUI

struct GuideView: View {
    @Binding var gameStatus: GameStatus
    
    var body: some View{
        Button {
            gameStatus = .play
        } label: {
            Text("게임화면으로 넘어가기")
        }
    }
}
