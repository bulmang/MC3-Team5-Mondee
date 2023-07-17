//
//  PlayView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import SwiftUI

struct PlayView: View {
    @StateObject private var gameState = GameStateManager()
    
    @State var selection = "GamePage"
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        TabView(selection: $selection) {
            GameOptionView()
                .tag("OptionPage")

            GeometryReader { geo in
                let deviceWidth = geo.size.width
                
                if gameState.isGameStarted {
                    ZStack() {
                        VStack {
                            HStack {
                                ForEach(0..<gameState.heartCount, id: \.self) { number in
                                    Image("Heart-WatchOS")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26)
                                }
                                Spacer()
                            }
                            Spacer()
                        }.padding(.all, CGFloat(12))
                        if gameState.isCharacterClean {
                            Image("ImgMondeeBasic-WatchOS").resizable()
                                .frame(width: 120, height: 120)
                                .padding(.top, CGFloat(40))
                        } else {
                            Image("ImgMondeeBlack-WatchOS").resizable()
                                .frame(width: 120, height: 120)
                                .padding(.top, CGFloat(40))
                        }
                        if gameState.isCharacterBubbling {
                            VStack {
                                Spacer()
                                Image("ImgBathTubBubble-WatchOS")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: deviceWidth)
                            }
                        }
                        VStack {
                            Spacer()
                            Image("ImgBathTubTower-WatchOS")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: deviceWidth)
                                .edgesIgnoringSafeArea(.all)
                        }
                        VStack {
                            Spacer()
                            if gameState.isGameFinished {
                                Text(gameState.isGameSuccessful ? "게임 성공" : "게임 실패")
                                    .font(.largeTitle).foregroundColor(.black)
                            } else {
                                Text("\(formatTime(gameState.remainingSeconds))")
                                    .font(.largeTitle).foregroundColor(.black)
                            }
                        }.padding(.bottom, CGFloat(12))
                    }
                    .navigationTitle {
                        HStack {
                            Text("남은 하트 개수: \(gameState.heartCount)")
                                .font(.subheadline)
                                .foregroundColor(.mint)
                                .fontDesign(.rounded)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                    }
                    .ignoresSafeArea()
                } else {
                    Button {
                        gameState.playGame()
                    } label: {
                        Text("게임 시작")
                    }
                }
            }
            .tag("GamePage")
        }
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let formattedSeconds = String(format: "%02d", seconds % 60)
        return "\(minutes):\(formattedSeconds)"
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(gameStatus: .constant(.play))
    }
}
