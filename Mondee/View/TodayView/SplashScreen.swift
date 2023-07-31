//
//  SplashScreen.swift
//  Mondee
//
//  Created by woozu on 2023/07/31.
//

import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        VStack {
            ZStack {
                Color.mondeeBlue
                    .ignoresSafeArea()
                LottieView(fileName: "SplashScreenMondee", loopMode: .loop)
                    .scaledToFit()
                    .padding(.bottom)
                    .scaleEffect(0.2)
                    .padding(.bottom,100)
                Text("MONDEE")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top,20)
            }
        }
    }
}
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
