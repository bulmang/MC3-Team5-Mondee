//
//  Lottie.swift
//  Mondee
//
//  Created by woozu on 2023/07/31.
//

import Foundation
import SwiftUI
// import Lottie!!
import Lottie

struct LottieView: UIViewRepresentable {
    // 입력받을 파일명과 loopMode
    let fileName: String
    let loopMode : LottieLoopMode
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: fileName)
        // 입력한 loopMode로 재생
        animationView.loopMode = loopMode
        animationView.play()
        
        return animationView
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
    }
}
