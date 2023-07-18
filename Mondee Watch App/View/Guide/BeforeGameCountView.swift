//
//  BeforeGameCountView.swift
//  Mondee Watch App
//
//  Created by seunghoria on 2023/07/17.
//

import SwiftUI

struct BeforeGameCountView: View {
    @State private var countdown: Int = 3
    @Binding var isGuideActive: Bool
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        VStack {
            if countdown > 0 {
                Text("\(countdown)")
                    .font(.system(size: 100))
                    .modifier(BubbleFontModifier())
                    .padding()
                    .onAppear {
                        startCountdown()
                    }
            } else {
                Text("GO!")
                    .font(.system(size: 80))
                    .modifier(BubbleFontModifier())
                    .padding()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            gameStatus = .play
                        }
                    }
            }
            
        }
        
    }
    
    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            countdown -= 1
            if countdown == 0 {
                timer.invalidate()
            }
        }
    }
    
}


struct BeforeGameCountView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeGameCountView(isGuideActive: .constant(false), gameStatus: .constant(.guide))
    }
}
