//
//  MondeeImageView.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/19.
//

import SwiftUI

struct MondeeImageView: View {
    @ObservedObject var gameState: GameStateManager
    
    var body: some View {
        let image: Image
        
        switch (gameState.isCharacterClean, gameState.isCharacterBubbling) {
        case (true, true):
            image = Image("ImgMondeeHappySmile-WatchOS")
        case (true, false):
            image = gameState.isPreWarning ? Image("ImgMondeeSad-WatchOS") : Image("ImgMondeeWhite-WatchOS")
        case (false, _):
            image = Image("ImgMondeeBlack-WatchOS")
        }
        
        return image
            .resizable()
            .frame(width: 120, height: 120)
            .padding(.top, CGFloat(40))
    }
}
