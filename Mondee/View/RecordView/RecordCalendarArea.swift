//
//  RecordCalendarArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/25.
//

import SwiftUI

struct RecordCalendarArea: View {
    @Binding var currentDate : Date
    @Binding var currentMonth : Int // 화살표 클릭으로 인한 월 세는 변수

    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(maxWidth: .infinity)
            .frame(height: 440)
            .foregroundColor(Color.mondeeBoxBackground)
            .overlay(alignment: .leading){
                VStack(alignment: .leading){
                    RecordCalendarView(currentDate: $currentDate, currentMonth: $currentMonth)
                        .padding(.top, 25)
                }
                .padding(.horizontal, 17)
            }
    }
}

struct RecordCalendarArea_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            RecordCalendarArea(currentDate: .constant(Date()), currentMonth: .constant(0))
        }
    }
}
