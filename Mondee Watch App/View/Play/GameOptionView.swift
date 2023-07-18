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
    @State var gameTerminationAlert = false
    
    @Binding var selection: PlayViewSelection
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        WatchButton(SFSymbol: "checkmark", label: "오늘 완료") {
                            gameState.successGameEarly()
                            gameStatus = .success
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
//                            gameState.giveUpGame()
//                            withAnimation() {
//                                selection = .game
//                            }
                            gameTerminationAlert = true
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
                .alert("게임을 포기하시겠어요?", isPresented: $gameTerminationAlert) {
                    Button(role: .destructive) {
                        gameState.giveUpGame()
                        gameStatus = .fail
                        withAnimation() {
                            selection = .game
                        }
                    } label: {
                        Text("오늘 그만")
                    }

                    Button(role: .cancel) {
                        
                    } label: {
                        Text("취소")
                    }

                }
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
        GameOptionView(selection: .constant(.option), gameStatus: .constant(.play))
    }
}
