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
    @State private var isGameSuccess = false
    
    var randomDirtyLine: String {
        return dirtyMondeeLines.randomElement() ?? ""
    }
    
    var randomCleanLine: String {
        return cleanMondeeLines.randomElement() ?? ""
    }
    
    var body: some View {
        VStack() {
            HStack {
                Text("먼디")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom, 8)
            Image(viewModel.currentLevel.mondeeImg)
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding()
                .onTapGesture {
                    isMondeeTalking.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                    {
                        withAnimation(.easeOut) {
                            isMondeeTalking = false
                        }
                    }
                }
        }
        .overlay(alignment: .top) {
            if isMondeeTalking {
                Text(isGameSuccess ? randomCleanLine : randomDirtyLine)
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .background(Color.mondeeSpeechBubble)
                    .clipShape(Capsule())
                    .shadow(radius: 3)
                    .offset(y: 45)
            }
        }
        .padding(.all, 20)
        .background(Color.mondeeBoxBackground)
        .cornerRadius(20)
    }
}
