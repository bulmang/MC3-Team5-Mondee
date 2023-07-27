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
            .padding(.bottom, 30)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.mondeeBoxBackground)
            )
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            CustomTabBar(selectedTab: .constant(.today))
        }
    }
}
