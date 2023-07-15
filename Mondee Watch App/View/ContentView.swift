//
//  ContentView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GameView().ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
