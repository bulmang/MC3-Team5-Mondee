//
//  ContentView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameState = GameStateManager()
    var body: some View {
        GameView()
            .onAppear{
                gameState.checkIfNewDay()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
