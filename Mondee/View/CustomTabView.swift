//
//  CustomTabView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var selectedTab: Tab = .today
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Group {
                switch selectedTab {
                case .today:
                    TodayView()
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
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
