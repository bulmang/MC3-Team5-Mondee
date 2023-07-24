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
            .frame(height: 450)
            .foregroundColor(.white)
            .overlay(alignment: .leading){
                VStack(alignment: .leading){
                    Text("청소 캘린더")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 11)
                        .padding(.top, 27)
                    RecordCalendarView(currentDate: $currentDate)
                }
                .padding(.horizontal, 17)
               
                
            }
    }
}

struct RecordCalendarArea_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBgLight")
            RecordCalendarArea(currentDate: .constant(Date()))
        }
    }
}
