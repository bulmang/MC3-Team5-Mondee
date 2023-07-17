//
//  Mondee.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/15.
//

import SwiftUI

struct Mondee: View {
    
    // MARK: PROPERTIES
    
    var mondeeWidth: CGFloat
    var deviceHeight: CGFloat
    var startGame: Bool
    
    @Binding var mondeeScroll: CGFloat
    
    private let mondeeFinalLocationRatio = 2.5
    private let topScrollLimit = 250
    
    let bottomScrollLimit : CGFloat
    
    var body: some View {
        Image("ImageWatchMondee")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: mondeeWidth)
            .offset(y: startGame ? deviceHeight / mondeeFinalLocationRatio : -((self.mondeeScroll) / 6))
            .focusable(isFocusable)
            .digitalCrownRotation($mondeeScroll, from: CGFloat(bottomScrollLimit), through: CGFloat(topScrollLimit))
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
    }
    
    private var isFocusable: Bool {
        return mondeeScroll > bottomScrollLimit
    }
}
