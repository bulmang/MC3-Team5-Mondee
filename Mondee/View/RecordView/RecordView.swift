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
    
    var body: some View {
        
        ZStack{
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
                            RecordCalendarArea(currentDate: $currentDate)
                            MonthStatistics()
                            TotalStatistics()
                        }
                        .padding(.horizontal, 13)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 100)
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
