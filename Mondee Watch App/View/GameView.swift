//  GameView.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/13.
//
import SwiftUI
import CoreMotion

enum GameStatus {
    case beforeGame, playingGame, afterGame
}

struct GameView: View {
    @State private var gameStatus: GameStatus = .beforeGame
    @State private var mondeeScroll: CGFloat = 0.0
    @State private var isGuideActive: Bool = false
    @State private var isGameStartActive: Bool = false
    
    private let bottomScrollLimit: CGFloat = -270
    private let gameStartScroll: CGFloat = -280
    
    var body: some View {
        
        startGameOnCharacterReachedBath()

        // TODO: 추후 print 코드 제거 요망
        let _ = print("mondeeScroll : \(mondeeScroll)")
        
        switch gameStatus {
        case .beforeGame:
            return AnyView(BeforeGameView(mondeeScroll: $mondeeScroll, isGuideActive: $isGuideActive, bottomScrollLimit: bottomScrollLimit))
        case .playingGame:
            return AnyView(Text("Playing"))
        case .afterGame:
            return AnyView(GameGuideView().transition(.move(edge: .bottom)))
        }
    }
    
    // MARK: Fuctions
    
    fileprivate func startGameOnCharacterReachedBath() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if mondeeScroll <= bottomScrollLimit {
                mondeeScroll = gameStartScroll
                isGuideActive = true
                WKInterfaceDevice.current().play(.start)
                whenCancel()
            }
        }
    }
    
    fileprivate func whenCancel() {
        if isGuideActive == false {
            mondeeScroll = 0
        }
    }
}


struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GamePlayView: View {
    @StateObject private var movingDetector = MovingDetector()
    
    var body: some View {
        ZStack {
            movingDetector.isMoving ? Color.red : Color.blue
            
            VStack {
                Text("\(movingDetector.distanceMoved)")
            }
        }
        .onDisappear {
            movingDetector.stopMotionUpdates()}}}

struct GameGuideView: View {
    var body: some View{
        Text("Guide")
    }
}

