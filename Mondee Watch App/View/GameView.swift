//
//  GameView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/13.
//

import SwiftUI
import CoreMotion

struct GameView: View {
    @StateObject private var movingDetector = MovingDetector()
    
    var body: some View {
        ZStack {
            movingDetector.isMoving ? Color.red : Color.blue
            
            VStack {
                Text("\(movingDetector.distanceMoved)")
            }
        }
        .onDisappear {
            movingDetector.stopMotionUpdates()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
