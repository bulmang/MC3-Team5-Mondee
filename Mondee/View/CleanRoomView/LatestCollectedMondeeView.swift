//
//  LatestCollectedMondeeView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import SwiftUI

struct LatestCollectedMondeeView: View {
    var body: some View {
        VStack(spacing: 2) {
            ZStack {
                Circle()
                    .frame(width: 168)
                    .foregroundColor(Color(.systemGray6))
                Image("ImgCollectedMondee001-IOS")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .padding(.bottom, 15)
            }
            .padding(.bottom, 10)
            Text("최근 획득한 먼디")
                .font(.callout)
            Text("7월 23일에 먼디를 획득했어요")
                .font(.footnote)
                .foregroundColor(.mondeeGrey)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.mondeeBoxBackground)
        )
        .padding(.top, 5)
        .padding(.horizontal, 19)
    }
}

struct LatestCollectedMondeeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            LatestCollectedMondeeView()
        }
    }
}
