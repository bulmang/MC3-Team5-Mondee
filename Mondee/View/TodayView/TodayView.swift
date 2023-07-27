//
//  TodayView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct TodayView: View {
    @StateObject private var viewModel = TodayViewModel()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 1)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    InfoIconSection()
                    TitleSection()
                    MondeeLevelView(viewModel: viewModel)
                    MondeeBoxView(viewModel: viewModel)
                    ShareButtonSection()
                    Spacer()
                }
            }.padding(.all, 24.0)
        }
    }
}

struct InfoIconSection: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "info.circle.fill")
                .font(.title2)
                .foregroundColor(.mondeeDarkGrey)
                .onTapGesture {
                    print("Tap Info Button")
                }
        }
    }
}

struct TitleSection: View {
    var body: some View {
        HStack {
            Text("청소 갓생 살아보자고!")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct ShareButtonSection: View {
    var body: some View {
        HStack {
            Text("오늘의 먼디 자랑하기")
            Spacer()
            Image(systemName: "chevron.right")
                .font(.title2)
                .foregroundColor(.mondeeGrey)
                .onTapGesture {
                    print("Hi")
                }
        }
        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 24))
        .background(Color.mondeeBoxBackground)
        .cornerRadius(29)
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView().background(Color.mondeeBackgroundGrey)
    }
}
