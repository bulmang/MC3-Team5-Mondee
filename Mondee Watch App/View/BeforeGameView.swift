//
//  BeforeGameView.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/14.
//

import SwiftUI

struct BeforeGameView: View {
    
    // MARK: Properties
    
    @Binding var mondeeScroll: CGFloat
    @Binding var isGuideActive: Bool
    
    private let topScrollLimit = 250
    private let mondeePadding = 100
    private let mondeeFinalLocationRatio = 2.5
    
    let bottomScrollLimit : CGFloat
    
    var body: some View {
        GeometryReader { geo in
            
            let deviceHeight = geo.size.height
            let deviceWidth = geo.size.width
            let mondeeWidth = geo.size.width - CGFloat(mondeePadding)
            
            NavigationView {
                ZStack(alignment: .top) {
                    
                    // MARK: MONDEE
                    
                    Image("ImageWatchMondee")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: mondeeWidth)
                        .offset(y: startGame ? deviceHeight/mondeeFinalLocationRatio : -((self.mondeeScroll)/6))
                        .focusable(isFocusable)
                        .digitalCrownRotation($mondeeScroll, from: CGFloat(bottomScrollLimit), through:CGFloat(topScrollLimit))
                    .navigationTitle {
                        HStack {
                            Text("Mondee")
                                .foregroundColor(.mint)
                                .fontDesign(.rounded)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.hidden)
                    .ignoresSafeArea(.all)
                    
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
                .padding(.top,50)
                .ignoresSafeArea()
            }
            .sheet(isPresented: $isGuideActive) {
                GameGuideView()
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
            }
        }
    }
    
    private var startGame: Bool {
        return  mondeeScroll <= CGFloat(bottomScrollLimit)
    }
    
    private var isFocusable: Bool {
        return mondeeScroll > bottomScrollLimit
    }
    
    private var opacityValue: Double {
        return mondeeScroll <= bottomScrollLimit ? 0 : 1
    }
    
}

