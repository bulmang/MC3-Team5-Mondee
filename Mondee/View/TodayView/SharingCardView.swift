//
//  SharingCardView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/28.
//

import SwiftUI

struct SharingCardView: View {
    let selection: Int
    let cleaningTime: Int
    
    @ObservedObject var viewModel: TodayViewModel
    
    var body: some View {
        ZStack {
            Image(viewModel.todayMondee?.mondeeImg ?? viewModel.currentLevel.mondeeImg)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.top)
            
            if selection == 0 {
                SharingCard1View(cleaningTime: cleaningTime)
            } else if selection == 1 {
                SharingCard2View()
            }
        }
    }
}

