//
//  MondeeLevelView.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/25.
//

import SwiftUI

struct MondeeLevelView: View {
    @ObservedObject var viewModel: TodayViewModel
    @Binding var isLevelInfoPopup: Bool
    
    private var currentProgress: Int {
        let maxCount = 16
        return viewModel.successCount >= maxCount ? 4 : viewModel.successCount % 4
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            Text("\(viewModel.currentLevel.name)")
                .font(.title)
                .fontWeight(.bold)
            .padding(.bottom, 8)
            HStack(alignment: .lastTextBaseline) {
                VStack(alignment: .leading) {
                    Text("\(viewModel.currentLevel.nextLevelMessage)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 4)
                    ProgressView(value: CGFloat(currentProgress), total: 4)
                        .progressViewStyle(LinearProgressViewStyle(tint: .mondeeBlue))
                        .scaleEffect(y: 1.5)
                }
                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("\(currentProgress)")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(" / 4")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.all, 20)
        .background(Color.mondeeBoxBackground)
        .cornerRadius(20)
        .onTapGesture {
            isLevelInfoPopup = true
        }
    }
}
