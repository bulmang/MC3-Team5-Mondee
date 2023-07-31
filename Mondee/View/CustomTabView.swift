//
//  CustomTabView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct CustomTabView: View {
    
    @StateObject private var viewModel = TodayViewModel()
    
    @State var selectedTab: Tab = .today
    @State private var isRulePopup = false
    @State private var isLevelInfoPopup = false
    @State var experiencePointAnimation = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack (alignment: .bottom) {
                    Color.mondeeBackgroundGrey.ignoresSafeArea()
                    Group {
                        switch selectedTab {
                        case .today:
                            TodayView(viewModel: viewModel, isRulePopup: $isRulePopup, isLevelInfoPopup: $isLevelInfoPopup, experiencePointAnimation: $experiencePointAnimation)
                        case .record:
                            RecordView()
                        case .cleanRoom:
                            CleanRoomView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    CustomTabBar(selectedTab: $selectedTab)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .edgesIgnoringSafeArea(.bottom)
                }
                .blur(radius: (isLevelInfoPopup || isRulePopup) ? 2 : 0)

                if isRulePopup {
                    GameRulePopupView(isRulePopup: $isRulePopup)
                        .transition(.opacity)
                }
                
                if isLevelInfoPopup {
                    LevelPopupView(isLevelInfoPopup: $isLevelInfoPopup)
                        .transition(.opacity)
                }
            }
            .fullScreenCover(isPresented: $viewModel.newMondee) {
                AfterSuccessPopupView(viewModel: viewModel, experiencePointAnimation: $experiencePointAnimation)
                    .transition(.opacity)
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
