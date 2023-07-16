//
//  CountDownView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/16.
//

import SwiftUI

struct CountDownView: View {
    @State private var count = 3
    @Binding var gameStatus: GameStatus

    var body: some View {
        VStack {
            if count > 0 {
                Text("\(count)")
                    .font(.system(size: 150))
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                    .foregroundStyle(
                        Color.black
                        .shadow(.inner(color: .pink.opacity(0.5), radius: 4, x: 2, y: 2))
                        .shadow(.inner(color: .blue, radius: 4, x: -2, y: 0))
                        .shadow(.inner(color: .yellow.opacity(0.5), radius: 4, x: 1.5, y: -2))
                        .shadow(.inner(color: .white.opacity(0.5), radius: 4, x: 0, y: 2))
                    )
                    .onAppear {
                        startCountDown()
                    }
            } else {
                Text("Go!")
                    .font(.system(size: 100))
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                    .foregroundStyle(
                        Color.black
                        .shadow(.inner(color: .pink.opacity(0.5), radius: 4, x: 2, y: 2))
                        .shadow(.inner(color: .blue, radius: 4, x: -2, y: 0))
                        .shadow(.inner(color: .yellow.opacity(0.5), radius: 4, x: 1.5, y: -2))
                        .shadow(.inner(color: .white.opacity(0.5), radius: 4, x: 0, y: 2))
                    )
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            gameStatus = .play
                                    }
                    }
            }
        }
    }
    
    private func startCountDown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            count -= 1
            
            if count <= 0 {
                timer.invalidate()
            }
        }
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView(gameStatus: .constant(.guide))
    }
}
