//
//  MondeeApp.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

@main
struct Mondee_Watch_AppApp: App {
    let sessionExtend = SessionExtend()

    init() {
        sessionExtend.startSession()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
