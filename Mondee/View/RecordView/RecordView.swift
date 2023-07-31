//
//  RecordView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct RecordView: View {
    @State var currentDate = Date()
    @State private var scrollViewOffset: CGFloat = 0
    
    @State var currentMonth : Int = 0 // 화살표 클릭으로 인한 월 세는 변수
        
    var body: some View {
        
        ZStack(alignment: .top){
            VStack {
                Color.mondeeBoxBackground
                Color.mondeeBackgroundGrey
            }
            ScrollView{
                ZStack {
                    Color.mondeeBackgroundGrey.padding(.top, 25)
                    VStack(spacing: 15){
                        RecordTitleArea()
                        VStack(spacing: 15){
                            RecordCalendarArea(currentDate: $currentDate, currentMonth: $currentMonth)
                            MonthStatistics(currentMonth: $currentMonth)
                            TotalStatistics()
                        }
                        .padding(.horizontal, 13)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 100)
            }
            Rectangle().frame(height: 60)
                .foregroundColor(.mondeeBoxBackground)
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
