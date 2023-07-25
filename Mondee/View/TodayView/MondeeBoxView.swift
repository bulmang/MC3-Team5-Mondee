//
//  MondeeBoxView.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/25.
//

import SwiftUI

struct MondeeBoxView: View {
    @ObservedObject var viewModel: TodayViewModel
    
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
        }
        .padding(.all, 20)
        .background(Color.mondeeBoxBackground)
        .cornerRadius(20)
    }
}
