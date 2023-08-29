//
//  RecordStatisticsArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/25.
//

import SwiftUI

struct TotalStatistics: View {
    
    @ObservedObject var userData: UserData
    
    private var challengeCount: Int { userData.countGameSuccess() + userData.countGameFail() }
    private var successCount: Int { userData.countGameSuccess() }
    private var totalPlayTime: Int { userData.totalGamePlayTime() }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(maxWidth: .infinity)
            .frame(height: 198)
            .foregroundColor(Color.mondeeBoxBackground)
            .overlay(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Spacer()
                    Text("전체 기록")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 9)
                        .padding(.leading, 27)
                    HStack(spacing: 20){
                        VStack(spacing: 0){
                            Image("ImgStatisticsMonth")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                            Text("총 도전 횟수")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color.mondeeGrey)
                                .padding(.bottom,2)
                            Text("\(challengeCount)")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color.mondeeBlue)
                        }
                        .frame(maxWidth: .infinity)
                        VStack(spacing: 0){
                            Image("ImgStatisticsTotal")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                            Text("총 성공 횟수")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color.mondeeGrey)
                                .padding(.bottom,2)
                            Text("\(successCount)")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color.mondeeBlue)
                        }
                        .frame(maxWidth: .infinity)
                        VStack(spacing: 0){
                            Image("ImgStatisticsRate")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                            Text("총 플레이 시간")
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
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal,48)
                    .padding(.bottom, 22)
                }
                
            }
    }
}

struct TotalStatistics_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            TotalStatistics(userData: UserData())
        }
    }
}
