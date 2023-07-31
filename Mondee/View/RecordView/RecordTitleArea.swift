//
//  RecordTitleArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/24.
//

import SwiftUI

struct RecordTitleArea: View {
    
    @ObservedObject var userData: UserData

    var body: some View {
        
        /// 최대 연속 횟수 확인 maxConsecutiveSuccessCount 사용
        let (recentConsecutiveSuccessCount, _) = userData.consecutiveSuccessCounts()
        
        RoundedRectangle(cornerRadius: 22)
            .frame(maxWidth: .infinity)
            .frame(height: 163)
            .foregroundColor(Color.mondeeBoxBackground)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 4)
            .overlay(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Spacer()
                    Text("연속 성공 \(recentConsecutiveSuccessCount)일차🎉")
                        .font(.system(size: 27, weight: .bold))
                        .padding(.bottom,7)
                    Text("성공 버블을 모아보세요")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color.mondeeGrey)
                        .padding(.bottom, 25)
                }
                .padding(.leading, 42)
            }
            
    }
}

struct RecordTitleArea_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            RecordTitleArea(userData: UserData())
        }
    }
}
