//
//  OnboardingView.swift
//  Mondee
//
//  Created by Sunjoo IM on 2023/07/20.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            
            VStack {
                Text("끼니는 절대 거르지 않지만")
                Text("방청소는 밥먹듯이 거르는 당신!")
            }
            .foregroundColor(.white)
            
            VStack {
                Text("침대에 눕기 전,")
                Text("10분만 투자해도 방청소 완!")
            }
            .foregroundColor(.yellow)
            
            VStack {
                Text("이제는 먼디와 함께")
                Text("깨끗한 방을 만들어보자고~!")
            }
            .foregroundColor(.green)
            
        }
        .background(.black)
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
        .onAppear {
            setupAppearance()
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.blue.withAlphaComponent(0.5)
    
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
