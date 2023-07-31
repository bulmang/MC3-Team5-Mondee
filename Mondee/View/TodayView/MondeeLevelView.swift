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
    @Binding var experiencePointAnimation: Bool
    
    private var currentProgress: Int {
        let maxCount = 16
        return viewModel.successCount >= maxCount ? 4 : viewModel.successCount % 4
    }
    
    @State var experiencePoints: CGFloat = 0
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            Text("\(viewModel.currentLevel.name)")
                .font(.title)
                .fontWeight(.bold)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(viewModel.currentLevel.nextLevelMessage)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 6)
                        .foregroundColor(Color(.systemGray5))
                        .cornerRadius(3)
                        .overlay {
                            GeometryReader { geo in
                                Rectangle()
                                    .frame(width: experiencePoints * geo.size.width * 0.25, height: 6)
                                    .foregroundColor(.mondeeBlue)
                                    .cornerRadius(3)
                            }
                        }
                        .onChange(of: experiencePointAnimation) { _ in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation() {
                                    experiencePoints = CGFloat(currentProgress)
                                }
                                
                                experiencePointAnimation = false
                            }
                        }
                        .onAppear {
                            experiencePoints = CGFloat(currentProgress)
                        }
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
        .frame(maxWidth: .infinity)
        .padding(.all, 20)
        .background(Color.mondeeBoxBackground)
        .cornerRadius(20)
        .onTapGesture {
            withAnimation() {
                isLevelInfoPopup = true
            }
        }
    }
}

struct MondeeLevelView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            MondeeLevelView(viewModel: TodayViewModel(), isLevelInfoPopup: .constant(false), experiencePointAnimation: .constant(false))
                .padding()
        }
    }
}
