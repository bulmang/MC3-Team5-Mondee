//
//  TodayView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct TodayView: View {
    @StateObject private var viewModel = TodayViewModel()
    @Binding var isRulePopup: Bool
    @Binding var isLevelInfoPopup: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 1)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        InfoIconSection(isRulePopup: $isRulePopup)
                        TitleSection()
                        MondeeLevelView(viewModel: viewModel, isLevelInfoPopup: $isLevelInfoPopup)
                        MondeeBoxView(viewModel: viewModel)
                        ShareButtonSection(viewModel: viewModel)
                        Spacer()
                    }
                }.padding(.all, 16)
            }
        }
        .fullScreenCover(isPresented: $viewModel.newMondee) {
            AfterSuccessPopupView(viewModel: viewModel)
                .transition(.opacity)
        }
    }
}

struct InfoIconSection: View {
    @Binding var isRulePopup: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                withAnimation() {
                    isRulePopup = true
                }
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
    @ObservedObject var viewModel: TodayViewModel
    
    var body: some View {
        NavigationLink {
            ShareView(viewModel: viewModel)
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
        TodayView(isRulePopup: .constant(false), isLevelInfoPopup: .constant(false)).background(Color.mondeeBackgroundGrey)
    }
}
