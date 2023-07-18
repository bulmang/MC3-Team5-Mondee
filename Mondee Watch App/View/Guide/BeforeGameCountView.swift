//
//  BeforeGameCountView.swift
//  Mondee Watch App
//
//  Created by seunghoria on 2023/07/17.
//

import SwiftUI

struct BeforeGameCountView: View {
    @State private var progress: CGFloat = 1
    @State private var countdown = 4
    @State private var countShow = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let countdownDuration: TimeInterval = 3
    @Binding var isGuideActive: Bool
    @Binding var gameStatus: GameStatus
    
    var body: some View {
        if countdown > 0 {
            VStack {
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    ))
                    .modifier(BubbleFontModifier())
                    .frame(width: 153, height: 153)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut, value: progress)
                    .onAppear {
                        startCountdown()
                    }
                    .background(
                        Circle()
                            .stroke(style: StrokeStyle(
                                lineWidth: 10,
                                lineCap: .round
                            ))
                            .foregroundColor(.gray.opacity(0.2))
                    )
                    .overlay(
                        countShow
                        ?
                            Text("\(countdown)")
                                .font(.system(size: 100))
                                .modifier(BubbleFontModifier())
                                
                        :
                            Text("Ready")
                                .font(.system(size: 30))
                                .modifier(BubbleFontModifier())
   
                    )
            }
            .onReceive(timer) { _ in
                withAnimation {
                    if progress > 0 {
                        progress -= 0.3333
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        gameStatus = .play
                    }
                }
        }
    }
    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            countdown -= 1
            countShow = true
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
