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
    
    var body: some View {
        VStack {
            if countdown > 0 {
                Text("\(countdown)")
                    .font(.system(size: 100))
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                    .foregroundStyle(
                        .shadow(.inner(color: .pink.opacity(0.5), radius: 4, x: 2, y: 2))
                        .shadow(.inner(color: .blue, radius: 4, x: -2, y: 0))
                        .shadow(.inner(color: .yellow.opacity(0.5), radius: 4, x: 1.5, y: -2))
                        .shadow(.inner(color: .white.opacity(0.5), radius: 4, x: 0, y: 2))
                    )
                    .padding()
                    .onAppear {
                        startCountdown()
                    }
            } else {
                Image("ImageWatchBubblePung")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isGuideActive = false
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
        BeforeGameCountView(isGuideActive: .constant(false))
    }
}
