//
//  PlayView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import SwiftUI

struct PlayView: View {
    @StateObject private var gameState = GameStateManager()
    
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        if gameState.isGameStarted {
            VStack {
                Text("남은 하트 개수: \(gameState.heartCount)")
                    .font(.subheadline)
                if gameState.isGameFinished {
                    Text(gameState.isGameSuccessful ? "게임 성공" : "게임 실패")
                        .font(.largeTitle)
                } else {
                    Text("\(formatTime(gameState.remainingSeconds))")
                        .font(.largeTitle)
                }
                if gameState.isCharacterBubbling {
                    Text("씻는 중 🧼").padding().background(Color.green)
                } else {
                    Text("안 씻는 중 😭").padding().background(Color.gray)
                }
                if gameState.isCharacterClean {
                    Text("캐릭터는 깨끗합니다. ✨").padding().background(Color.yellow)
                } else {
                    Text("캐릭터는 더럽습니다. 🪰").padding().background(Color.brown)
                }
            }.background(gameState.isWarning ? Color.red : Color.clear)
        } else {
            Button {
                gameState.playGame()
            } label: {
                Text("게임 시작")
            }
        }
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let formattedSeconds = String(format: "%02d", seconds % 60)
        return "\(minutes):\(formattedSeconds)"
    }
}
