//
//  RecordCalendarArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/25.
//

import SwiftUI

struct RecordCalendarArea: View {
    @Binding var currentDate : Date
    
    var body: some View {
        RoundedRectangle(cornerRadius: 22)
            .frame(maxWidth: .infinity)
            .frame(height: 440)
            .foregroundColor(Color.mondeeBoxBackground)
            .overlay(alignment: .leading){
                VStack(alignment: .leading){
                    RecordCalendarView(currentDate: $currentDate)
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
            RecordCalendarArea(currentDate: .constant(Date()))
        }
    }
}
