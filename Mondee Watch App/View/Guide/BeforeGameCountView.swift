//
//  BeforeGameCountView.swift
//  Mondee Watch App
//
//  Created by seunghoria on 2023/07/17.
//

import SwiftUI

struct BeforeGameCountView: View {
    @State private var progress: CGFloat = 1.0
    @State private var countdown: Int = 3
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let countdownDuration: TimeInterval = 3
    @Binding var isGuideActive: Bool
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        if countdown > 0 {
            VStack {
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(lineWidth: 10)
                    .modifier(BubbleFontModifier())
                    .frame(width: 153, height: 153)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut, value: progress)
                    .onAppear {
                        startCountdown()
                    }
                    .overlay(
                        Text("\(countdown)")
                            .font(.system(size: 100))
                            .modifier(BubbleFontModifier())
                    )
            }
            .onAppear{
                progress -= 1 / CGFloat(countdownDuration)
            }
            .onReceive(timer) { _ in
                withAnimation {
                    if progress > 0 {
                        progress -= 1 / CGFloat(countdownDuration)
                    } else {
                        timer.upstream.connect().cancel()
                    }
                }
            }
        } else {
            Text("GO!")
                .font(.system(size: 80))
                .modifier(BubbleFontModifier())
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        gameStatus = .play
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
