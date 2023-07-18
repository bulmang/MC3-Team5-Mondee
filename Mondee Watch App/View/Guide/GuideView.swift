//
//  GuideView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/17.
//

import SwiftUI

struct GuideView: View {
    @State private var showGameCountView = false
    @Binding var isGuideActive: Bool
    @Binding var gameStatus: GameStatus

    var body: some View{
        VStack{
            if showGameCountView {
                BeforeGameCountView(isGuideActive: $isGuideActive, gameStatus: $gameStatus)
            } else {
                HStack{
                    Image("ImageWatchBubbles")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27)
                    Text("청소시간")
                        .font(.system(size: 20, weight: .semibold))
                    Image("ImageWatchBubble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }
                .padding(.bottom, 10)
                Text("몸을 움직여\n먼지를 씻겨주자")
                    .font(.system(size: 15, weight: .regular))
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showGameCountView = true
            }
        }
        
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(isGuideActive: .constant(true), gameStatus: .constant(.guide))
    }
}
