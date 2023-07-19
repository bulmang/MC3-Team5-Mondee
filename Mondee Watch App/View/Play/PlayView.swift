//
//  PlayView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

import SwiftUI

enum PlayViewSelection {
    case option
    case game
}

struct PlayView: View {
    @StateObject private var gameState = GameStateManager()
    
    @State var selection: PlayViewSelection = .game
    @State private var warningRemainSeconds = Double(Constants.dirtThreshold - Constants.warningThreshold)
    
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        TabView(selection: $selection) {
            GameOptionView(selection: $selection, gameStatus: $gameStatus)
                .environmentObject(gameState)
                .tag(PlayViewSelection.option)
            
            GeometryReader { geo in
                let deviceWidth = geo.size.width
                
                ZStack() {
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
                    if gameState.isCharacterClean && gameState.isCharacterBubbling {
                        Image("ImgMondeeHappySmile-WatchOS").resizable()
                            .frame(width: 120, height: 120)
                            .padding(.top, CGFloat(40))
                    } else if gameState.isCharacterClean {
                        if gameState.isSemiWarning {
                            Image("ImgMondeeSad-WatchOS").resizable()
                                .frame(width: 120, height: 120)
                                .padding(.top, CGFloat(40))
                        }
                        else {
                            Image("ImgMondeeWhite-WatchOS").resizable()
                                .frame(width: 120, height: 120)
                                .padding(.top, CGFloat(40))
                        }
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
                .onAppear {
                    gameState.playGame()
                }
                
                if gameState.isSemiWarning {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(Color.yellow.opacity(0.2))
                        .blur(radius: 8)
                }
                if gameState.isWarning {
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(Color.black)
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(Int(warningRemainSeconds * 2) % 2 == 0 ? Color.red.opacity(0.3) : .clear)
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Text("🚨").font(.system(size: 20))
                                Text("어서어서").font(.system(size: 20))
                                Text("움직이라구").font(.system(size: 20))
                                Text("\(Int(warningRemainSeconds + 0.5))")
                                    .font(.system(size: 100))
                                    .modifier(BubbleFontModifier())
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .onAppear {
                        startBlinking()
                    }
                }
            }
            .tag(PlayViewSelection.game)
            .onChange(of: gameState.isGameFinished) { isGameFinished in
                // gameState.isGameFinished에 기반하여 gameStatus 바인딩 업데이트
                if isGameFinished {
                    gameStatus = gameState.isGameSuccessful ? .success : .fail
                }
            }
        }
    }
    
    private func startBlinking() {
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                warningRemainSeconds -= 0.5
                if warningRemainSeconds == 0 {
                    warningRemainSeconds = Double(Constants.dirtThreshold - Constants.warningThreshold)
                    return
                }
                startBlinking()
            }
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
