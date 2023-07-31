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
    
    @ObservedObject var watchLiveDataModel = WatchLiveDataModel.shared
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                GameOptionView(selection: $selection, gameStatus: $gameStatus)
                    .environmentObject(gameState)
                    .tag(PlayViewSelection.option)
                
                GeometryReader { geo in
                    let deviceWidth = geo.size.width
                    
                    ZStack() {
                        MondeeImageView(gameState: gameState)
                        
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
                            Text("\(formatTime(gameState.remainingSeconds))")
                                .font(.largeTitle).foregroundColor(.black)
                                .timerFontModifier()
                                .frame(maxWidth: .infinity)
                                .monospacedDigit()
                        }.padding(.bottom, CGFloat(12))
                    }
                    .ignoresSafeArea()
                    .onAppear {
                        gameState.playGame()
                        watchLiveDataModel.gameStart = true
                        liveSendData()
                    }
                    if gameState.isPreWarning {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(Color.yellow.opacity(0.2))
                            .blur(radius: 8)
                    }
                }
                .tag(PlayViewSelection.game)
                .onChange(of: gameState.isGameFinished) { isGameFinished in
                    // gameState.isGameFinished에 기반하여 gameStatus 바인딩 업데이트
                    if isGameFinished {
                        gameState.watchDataModel.isRetry || gameState.watchDataModel.isSuccess || gameState.watchDataModel.isFail ? sendData() : nil
                        gameStatus = gameState.watchDataModel.isSuccess ? .success : .fail
                    }
                }
            }
            .overlay {
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
                                Group {
                                    Text("🚨")
                                    Text("어서어서")
                                    Text("움직이라구")
                                }
                                .font(.title3)
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
            .navigationTitle {
                HeartCountView(gameState: gameState)
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
    private func sendData() {
        gameState.watchDataModel.session.transferUserInfo(["GameSuccess":gameState.watchDataModel.isSuccess,"GameFail":gameState.watchDataModel.isFail, "GamePlayTime":gameState.watchDataModel.gamePlayTime, "GameDate":gameState.watchDataModel.gameDate, "RemainHeart":gameState.watchDataModel.remainHeart, "GameRetry":gameState.watchDataModel.isRetry])
        print("데이터 전송")
    }
    
    private func startBlinking() {
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                warningRemainSeconds -= 0.5
                if warningRemainSeconds <= 0 {
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
    
    private func liveSendData() {
        watchLiveDataModel.session.transferUserInfo(
            ["GameStart":watchLiveDataModel.gameStart,"GamePause":watchLiveDataModel.gamePause,"RemainHeartCount":gameState.watchLiveDataModel.remainHeartCount]
        )
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(gameStatus: .constant(.play))
    }
}
