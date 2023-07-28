//
//  RecordStatisticsArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/25.
//

import SwiftUI

struct MonthStatistics: View {
    
    @StateObject var userData = UserData()
    
    @Binding var currentMonth : Int
    
    private var challengeCount: Int { userData.countGameFail(inMonth: currentMonth) + userData.countGameSuccess(inMonth: currentMonth) }
    private var successCount: Int { userData.countGameSuccess(inMonth: currentMonth) }
    private var totalPlayTime: Int { userData.totalGamePlayTime(inMonth: currentMonth) }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 22)
            .frame(maxWidth: .infinity)
            .frame(height: 198)
            .foregroundColor(Color.mondeeBoxBackground)
            .overlay(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Text("\(extraMonthNumber(for: currentMonth))월 기록")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 21)
                        .padding(.leading, 27)
                    HStack(spacing: 30){
                        VStack(spacing: 0){
                            Image("ImgStatisticsMonth")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                            Text("도전 횟수")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color.mondeeGrey)
                                .padding(.bottom,2)
                            Text("\(challengeCount)")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color.mondeeBlue)
                        }
                        VStack(spacing: 0){
                            Image("ImgStatisticsTotal")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                            Text("성공 횟수")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color.mondeeGrey)
                                .padding(.bottom,2)
                            Text("\(successCount)")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color.mondeeBlue)
                        }
                        VStack(spacing: 0){
                            Image("ImgStatisticsRate")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                            Text("플레이 시간")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color.mondeeGrey)
                                .padding(.bottom,2)
                            HStack(alignment: .bottom, spacing:0){
                                Text("\(totalPlayTime / 60)")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(Color.mondeeBlue)
                                Text("M")
                                    .font(.system(size: 10, weight: .semibold))
                                    .foregroundColor(Color.mondeeBlue)
                                    .padding(.bottom, 3)
                            }
                        }
                    }
                    .padding(.top, 9)
                    .padding(.horizontal, 53)
                    Spacer()
                }
            }
    }
    
    private func extraMonthNumber(for monthOffset: Int) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        guard let targetDate = calendar.date(byAdding: .month, value: monthOffset, to: currentDate) else {
            return 0
        }
        let monthNumber = calendar.component(.month, from: targetDate)
        return monthNumber
    }
}

struct MonthStatistics_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            MonthStatistics(currentMonth: .constant(0))
        }
    }
}
