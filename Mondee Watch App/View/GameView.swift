//
//  GameView.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/13.
//

import SwiftUI
import CoreMotion

enum GameStatus {
    case preparation, guide, play, success, fail
}

struct GameView: View {
    @State private var gameStatus: GameStatus = .play
    @State private var mondeeScroll: CGFloat = 0.0
    @State private var isGuideActive: Bool = false
    @State private var isGameStartActive: Bool = false
    @State private var isFinalFail: Bool = false
    
    
    private let bottomScrollLimit: CGFloat = -270
    private let gameStartScroll: CGFloat = -280
    
    @ObservedObject var gameState = GameStateManager()
    
    var body: some View {
        
        startGameOnCharacterReachedBath()
        
        // TODO: 추후 print 코드 제거 요망
        let _ = print("mondeeScroll : \(mondeeScroll)")
        
        switch gameStatus {
        case .preparation:
            return AnyView(PreparationView(gameStatus: $gameStatus, mondeeScroll: $mondeeScroll, isGuideActive: $isGuideActive, bottomScrollLimit: bottomScrollLimit))
        case .guide:
            return AnyView(GuideView(isGuideActive: $isGuideActive, gameStatus: $gameStatus).transition(.move(edge: .bottom)))
        case .play:
            return AnyView(PlayView(gameStatus: $gameStatus))
        case .success:
            return AnyView(SuccessView())
        case .fail:
            if isFinalFail || gameState.watchDataModel.isFail || gameState.watchDataModel.isRetry {
                return AnyView(FinalFailView())
            } else {
                return AnyView(RetryFailView(isFinalFail: $isFinalFail, gameStatus: $gameStatus))
            }
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
