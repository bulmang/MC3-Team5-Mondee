//
//  ContentView.swift
//  Onboarding
//
//  Created by Sunjoo IM on 2023/07/24.
//

import SwiftUI



struct OnboardingView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State private var show: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                title()
                    .padding(.top,250)
                
                imageScene1()
                
                imageScene2()
                
                imageScene3()
                
                imageScene4()
                
                MondeeBlueButton(label: "시작하기") {
                    withAnimation(.spring()){
                        isOnboarding = false
                    }
                }
                .padding(.horizontal,22)
                .padding(.top, 50)
            }
        }
        .background(.white)
    }
    
    @ViewBuilder
    private func title () -> some View {
        VStack {
            Text("먼디를 구해줘!")
                .foregroundColor(.black)
                .font(.system(size: 40))
                .bold()
                .padding()
            Text("글.그림 먼디를 만든 사람들")
                .foregroundColor(.black)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
    }
    
    @ViewBuilder
    private func imageScene1() -> some View{
        
        Spacer()
            .frame(height: 100)
        
        VStack(spacing: 0) {
            
            Text("앗! 방청소를 너무 미룬 나머지\n먼디가 원래 모습을 잃어버렸어요..")
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .foregroundColor(.black)
                .font(.system(size: 22))
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .border(.black)
            
            Image("ImgOnboarding1-iOS")
                .resizable()
                .scaledToFit()
                .padding(.top,60)
        }
        .padding()
        
    }
    
    @ViewBuilder
    private func imageScene2() -> some View{
        
        VStack(alignment: .leading) {
            Image("ImgOnboarding2-iOS")
                .resizable()
                .scaledToFit()
                .overlay(alignment: .topLeading){
                    Text("그 때!\n애플워치를 차고\n방청소를 시작했더니...")
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .padding(30)
                        .border(.black)
                        .padding(.leading, 40)
                        .offset(y:-20)
                }
        }
        .padding(.top,120)
    }
    
    @ViewBuilder
    private func imageScene3() -> some View{
        VStack(alignment: .trailing) {
            Text("드디어 먼지 더미에서\n해방된 우리의 먼디!!")
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .foregroundColor(.black)
                .font(.system(size: 22))
                .padding(30)
                .border(.black)
                .padding(.trailing, 30)
            Image("ImgOnboarding3-iOS")
                .resizable()
                .scaledToFit()
        }
        .padding(.top, 120)
        .padding()
    }
    
    @ViewBuilder
    private func imageScene4() -> some View {
        
        VStack(spacing: 50) {
            Text("방청소를 하며\n매일 새로운 먼디를 만나보세요!")
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .foregroundColor(.black)
                .font(.system(size: 22))
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .border(.black)
            Image("ImgOnboarding4-iOS")
                .resizable()
                .scaledToFit()
        }
        .padding(.top, 120)
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: OnboardingView().preferredColorScheme)
    }
}
