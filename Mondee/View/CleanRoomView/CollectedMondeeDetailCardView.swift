//
//  CollectedMondeeDetailCardView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import SwiftUI

struct CollectedMondeeDetailCardView: View {
    
    @Binding var isDetailCardPopUp: Bool
    var test: Int = 0
    
    var body: some View {
        ZStack {
            Color.mondeeDarkGrey.opacity(0.3).ignoresSafeArea()
                .onTapGesture {
                    isDetailCardPopUp = false
                }
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("사탕먼디 \(test)")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("잡은 날짜 23.07.06")
                            .font(.footnote)
                    }
                    Spacer()
                    Button {
                        isDetailCardPopUp = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .opacity(0.5)
                    }
                    .buttonStyle(MondeeButtonClickStyle())
                }
                .foregroundColor(.white)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Image("ImgCollectedMondee001-IOS")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.bottom, 15)
                Spacer()
                Text("푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!")
                    .font(.footnote)
                    .foregroundColor(.white)
                Spacer()
                Text("MonDee")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.mondeeMint)
                Spacer()
                
            }
            .frame(height: 500)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.mondeeBlue).opacity(0.5)
                    .backgroundBlurEffect().cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 8)
            )
            .padding(.horizontal, 24)
        }
    }
}

struct CollectedMondeeDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            CollectedMondeeDetailCardView(isDetailCardPopUp: .constant(true))
        }
    }
}
