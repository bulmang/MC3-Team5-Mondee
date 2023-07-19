//
//  MondeeApp.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

@main
struct Mondee_Watch_AppApp: App {
    @AppStorage("finalfail") var isFinalFailActive = false
    @AppStorage("success") var isSuccessActive = false
    @AppStorage("lastDate") var lastDate: Int = 0

    var body: some Scene {
        WindowGroup {
            switch (isSuccessActive, isFinalFailActive) {
            case (true, _):
                SuccessView()
            case (_, true):
                FinalFailView()
            default:
                ContentView()
            }
        }
    }
}


