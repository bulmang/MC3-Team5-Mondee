//
//  PreparationView.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/14.
//

import SwiftUI

struct PreparationView: View {
    
    // MARK: Properties
    @Binding var gameStatus: GameStatus
    @Binding var mondeeScroll: CGFloat
    @Binding var isGuideActive: Bool
    
    private let mondeePadding = 100
    private let headerHeight = 50
    
    let bottomScrollLimit : CGFloat
    
    var body: some View {
        GeometryReader { geo in
            
            let deviceHeight = geo.size.height
            let deviceWidth = geo.size.width
            let mondeeWidth = geo.size.width - CGFloat(mondeePadding)
            
            NavigationView {
                ZStack(alignment: .top) {
                    
                    // MARK: MONDEE
                    
                    Mondee(mondeeWidth: mondeeWidth, deviceHeight: deviceHeight, startGame: startGame, mondeeScroll: $mondeeScroll, bottomScrollLimit: bottomScrollLimit)
                    
                    
                    // MARK: BATH IMAGE
                    
                    VStack {
                        Spacer()
                        Image("ImageWatchBath")
                            .resizable()
                            .frame(maxWidth: deviceWidth)
                    }
                    
                    // MARK: ARROW ANIMATION
                    
                    HStack {
                        Spacer()
                        ArrowAnimation()
                    }
                    .opacity(opacityValue)
                    
                }
                .padding(.top,CGFloat(headerHeight))
                .ignoresSafeArea()
            }
            .sheet(isPresented: $isGuideActive) {
                // GuideView(gameStatus: $gameStatus)
                GuideView(isGuideActive: $isGuideActive, gameStatus: $gameStatus)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button {
                                mondeeScroll = 0
                                self.isGuideActive = false
                            } label: {
                                Text("취소")
                            }
                        }
                    })
                    .toolbarBackground(.hidden)
            }
        }
    }
    
    private var startGame: Bool {
        return  mondeeScroll <= CGFloat(bottomScrollLimit)
    }
    
    private var opacityValue: Double {
        return mondeeScroll <= bottomScrollLimit ? 0 : 1
    }
    
}
