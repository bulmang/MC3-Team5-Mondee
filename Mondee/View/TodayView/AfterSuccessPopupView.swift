//
//  AfterSuccessPopupView.swift
//  Mondee
//
//  Created by woozu on 2023/07/26.
//

import SwiftUI

struct AfterSuccessPopupView: View {
    @ObservedObject var viewModel: TodayViewModel
    
    @Binding var experiencePointAnimation: Bool
    
    var body: some View {
        ZStack{
            Color("mondeeBackgroundGrey")
                .ignoresSafeArea()
            VStack{
                Text("청소 성공!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("mondeeBlue"))
                    .padding(.bottom,1)
                
                
                Text("메인화면에서")
                    .font(.title2)
                
                HStack{
                    Text("바뀐 먼디를 확인")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("해보세요")
                        .font(.title2)
                }
                .padding(.bottom,50)
                Image("ImgAfterSucessPopup-iOS")
                    .resizable()
                    .frame(width: 273,height: 251)
                
                
                MondeeBlueButton(label: "확인하러가기") {
                    viewModel.isCheckActive = true
                    
                    let todayMondee = mondeeList[
                        randomWithProbability(distribution: probabilities)
                    ]
                    viewModel.todayMondee = todayMondee
                    viewModel.saveTodayMondee(mondee: todayMondee)
                    viewModel.newMondee = false
                    
                    experiencePointAnimation.toggle()
                    
                }
                .padding(.horizontal,30)
                .padding(.top,30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}

