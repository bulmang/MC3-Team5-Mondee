//
//  MondeeApp.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

@main
struct MondeeApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
