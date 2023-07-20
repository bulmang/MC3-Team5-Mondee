//
//  CustomTabBar.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    
    @State private var isTabPressed = false
    
    private let tabTextSize: CGFloat = 23
    private let tabIconSize: CGFloat = 10
    
    var tabItems = [
        TabItem(text: "투데이", icon: "house", tab: .today),
        TabItem(text: "기록", icon: "note.text", tab: .record),
        TabItem(text: "멸균실", icon: "bubbles.and.sparkles", tab: .cleanRoom)
    ]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(tabItems) { item in
                    VStack(spacing: 5) {
                        Image(systemName: item.icon)
                            .font(.system(size: tabTextSize))
                            .scaleEffect(isTabPressed && selectedTab == item.tab ? 0.9 : 1.0) // 애니메이션 효과 추가
                            .animation(.spring(), value: isTabPressed) // 스프링 애니메이션 사용
                        Text(item.text)
                            .font(.system(size: tabIconSize))
                    }
                    .onTapGesture {
                        selectedTab = item.tab
                        isTabPressed = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isTabPressed = false
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(selectedTab == item.tab ? .blue : .secondary)
                }
            }
            .padding(.top, 13)
            .padding(.bottom, 27)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial)
            )
        }
    }
}


struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

enum Tab: String {
    case today
    case record
    case cleanRoom
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.today))
    }
}
