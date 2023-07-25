//
//  RecordStatisticsArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/25.
//

import SwiftUI

struct RecordStatisticsArea: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 22)
            .frame(maxWidth: .infinity)
            .frame(height: 198)
            .foregroundColor(.white)
            .overlay(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Spacer()
                    Text("나의 기록")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 9)
                        .padding(.leading, 27)
                    HStack(spacing: 40){
                        VStack(spacing: 0){
                            Image("ImgStatisticsMonth")
                                .padding(.bottom, 5)
                            Text("이번달 성공횟수")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color("ColorMondeeGrey"))
                                .padding(.bottom,2)
                            Text("9")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color("ColorMondeeBlue"))
                               
                        }
                        VStack(spacing: 0){
                            Image("ImgStatisticsTotal")
                                .padding(.bottom, 5)
                            Text("총 성공 횟수")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color("ColorMondeeGrey"))
                                .padding(.bottom,2)
                            Text("14")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color("ColorMondeeBlue"))
                        }
                        VStack(spacing: 0){
                            Image("ImgStatisticsRate")
                                .padding(.bottom, 5)
                            Text("도전대비 성공률")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color("ColorMondeeGrey"))
                                .padding(.bottom,2)
                            HStack(alignment: .bottom, spacing:0){
                                Text("80")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(Color("ColorMondeeBlue"))
                                Text("%")
                                    .font(.system(size: 10, weight: .semibold))
                                    .foregroundColor(Color("ColorMondeeBlue"))
                                    .padding(.bottom, 3)
                            }
                        }
                    }
                    .padding(.leading,52)
                    .padding(.bottom, 22)
                    //.border(.green)
                }
                
            }
    }
}

struct RecordStatisticsArea_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBgLight")
            RecordStatisticsArea()
        }
    }
}
