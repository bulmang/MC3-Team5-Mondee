//
//  TodayView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct TodayView: View {
    @StateObject private var viewModel = TodayViewModel()
    
    @State private var isLevelInfoPopup = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 1)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        InfoIconSection(isLevelInfoPopup: $isLevelInfoPopup)
                        TitleSection()
                        MondeeLevelView(viewModel: viewModel, isLevelInfoPopup: $isLevelInfoPopup)
                        MondeeBoxView(viewModel: viewModel)
                        ShareButtonSection()
                        Spacer()
                    }
                }.padding(.all, 24.0)
            }.blur(radius: (isLevelInfoPopup || viewModel.newMondee) ? 2 : 0)
            
            if isLevelInfoPopup {
                LevelPopupView(isLevelInfoPopup: $isLevelInfoPopup)
                    .transition(.opacity)
            }
            
            if viewModel.newMondee {
                AfterSuccessPopupView(viewModel: viewModel)
                    .transition(.opacity)
            }
        }
    }
}

struct InfoIconSection: View {
    @Binding var isLevelInfoPopup: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isLevelInfoPopup = true
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.title2)
                    .foregroundColor(.mondeeDarkGrey)
            }
            .buttonStyle(MondeeButtonClickStyle())
        }
    }
}

struct TitleSection: View {
    var body: some View {
        HStack {
            Text("청소 갓생 살아보자고!")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct ShareButtonSection: View {
    var body: some View {
        NavigationLink {
            ShareView()
        } label: {
            HStack {
                Text("오늘의 먼디 자랑하기")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(.mondeeGrey)
            }
            .padding(20)
        }
        .background(
            Capsule()
                .foregroundColor(.mondeeBoxBackground)
        )
        .navigationTitle("")
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView().background(Color.mondeeBackgroundGrey)
    }
}
