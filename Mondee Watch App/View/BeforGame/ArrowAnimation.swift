//
//  ArrowAnimation.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/13.
//

import SwiftUI

struct ArrowAnimation: View {
    @State var fade: Double = 0
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 2) {
            ForEach(0..<3) { i in
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
                isAnimating = true
                fade = 1.0
            }
        }
    }
}

struct ArrowAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ArrowAnimation()
    }
}
