//
//  ContentView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    @StateObject var data = PhoneDataModel.shared
    
    @State var splashActive:Bool = true
    
    var body: some View {
        Group{
            if splashActive {
                SplashScreen()
                    .offset(x: 5)
            } else {
                if isOnboarding {
                    OnboardingView()
                } else {
                    CustomTabView()
                        .transition(.opacity)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.splashActive = false
                }
            }
        }
        .animation(.spring(response: 0.5,dampingFraction: 0.75), value: isOnboarding)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
