//
//  ArrowAnimation.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/13.
//

import SwiftUI

struct ArrowAnimation: View {
    @State var fade = 0.0
    @State var isAnimating = false
    
    private let chevronCount = 3
    
    var body: some View {
        VStack(spacing: 2) {
            ForEach(0..<chevronCount, id: \.self) { i in
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 8, height: 6)
                    .foregroundColor(Color.white)
                    .opacity(self.fade)
                    .animation(Animation.easeOut(duration: 1)
                                .repeatForever(autoreverses: true)
                                .delay(0.3 * Double(i-2)), value: isAnimating)
            }
        }
        .onAppear {
            withAnimation {
                self.isAnimating = true
                self.fade = 1.0
            }
        }
    }
}

struct ArrowAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ArrowAnimation()
    }
}
