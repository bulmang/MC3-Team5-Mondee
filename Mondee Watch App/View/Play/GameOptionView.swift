//
//  GameOptionView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/17.
//

import SwiftUI

struct GameOptionView: View {
    @EnvironmentObject var gameState: GameStateManager
    
    @State var isPauseButton = true
    
    @Binding var selection: PlayViewSelection
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        WatchButton(SFSymbol: "checkmark", label: "오늘 완료") {
                            gameState.successGameEarly()
                            withAnimation() {
                                selection = .game
                            }
                        }
                        .disabled(!gameState.isEarlyTerminationPossible)
                        .tint(.blue)
                        WatchButton(SFSymbol: isPauseButton ? "pause" : "arrow.clockwise", label: isPauseButton ? "일시 정지" : "재개") {
                            isPauseButton.toggle()
                            if isPauseButton {
                                gameState.resumeGame()
                            }
                            else {
                                gameState.pauseGame()
                            }
                        }
                        .tint(.yellow)
                    }
                    HStack {
                        WatchButton(SFSymbol: "xmark", label: "오늘 그만") {
                            gameState.giveUpGame()
                            withAnimation() {
                                selection = .game
                            }
                        }
                        .tint(.red)
                        
                        WatchButton(SFSymbol: "", label: "") {
                            //action here
                        }
                        .tint(.clear)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationTitle {
                HStack {
                    Text(isPauseButton ? "게임 중" : "일시정지 됨")
                        .foregroundColor(isPauseButton ? .green : .yellow)
                    Spacer()
                }
                .foregroundColor(.green)
            }
        }
    }
}

struct WatchButton: View {
    
    var SFSymbol: String
    var label: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Image(systemName: SFSymbol)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(height: 35)
            }
            Text(label)
                .font(.caption2)
        }
    }
}

struct GameOptionView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionView(selection: .constant(.option))
    }
}
