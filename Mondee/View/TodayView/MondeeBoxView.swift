//
//  MondeeBoxView.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/25.
//

import SwiftUI

struct MondeeBoxView: View {
    @ObservedObject var viewModel: TodayViewModel
    
    @State private var isMondeeTalking = false
    
    var randomMondeeLine: String {
        return viewModel.gameStatus == .finishedSuccess ? cleanMondeeLines.randomElement() ?? "" : dirtyMondeeLines.randomElement() ?? ""
    }
    
    var mondeeImage: Image {
        switch viewModel.gameStatus {
        case .notStarted, .finishedFail:
            return Image(viewModel.currentLevel.mondeeImg)
        case .finishedSuccess:
            return Image("ImgMondeePudding-IOS")
        case .inProgress:
            return Image("ImgMondeeCaution-IOS")
        default:
            return Image(viewModel.currentLevel.mondeeImg)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("먼디")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom, 8)
            
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    Spacer()
                    Image("ImgMondeeShadow-IOS")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                
                mondeeImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding()
                    .onTapGesture {
                        if !(viewModel.gameStatus == .inProgress) {
                            isMondeeTalking.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeOut) {
                                    isMondeeTalking = false
                                }
                            }
                        }
                    }
            }
        }
        .overlay(alignment: .top) {
            if isMondeeTalking {
                Text(randomMondeeLine)
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .background(Color.mondeeSpeechBubble)
                    .clipShape(Capsule())
                    .shadow(radius: 3)
                    .offset(y: 45)
            }
        }
        .frame(height: 330)
        .padding(.all, 20)
        .background(Color.mondeeBoxBackground)
        .cornerRadius(20)
    }
}
