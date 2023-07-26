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
            Color.mondeeDarkGrey.opacity(0.5).ignoresSafeArea()
                .onTapGesture {
                    isDetailCardPopUp = false
                }
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("사탕먼디 \(test)")
                            .font(.system(size: 24, weight: .bold))
                            .fontWeight(.semibold)
                        Text("잡은 날짜 23.07.06")
                            .font(.system(size: 15))
                    }
                    .padding(30)
                    Spacer()
                    Button {
                        isDetailCardPopUp = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .bold()
                            .opacity(0.6)
                            .offset(x: -10, y: -30)
                    }
                    .buttonStyle(MondeeButtonClickStyle())
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                Rectangle()
                    .frame(height: 1)
                    .padding(.top, -20)
                    .foregroundColor(.white)
                
                Image("ImgCollectedMondee001-IOS")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.bottom, 15)
                Spacer()
                Text("푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!")
                    .font(.system(size: 15))
                    .lineSpacing(5)
                    .foregroundColor(.white)
                Spacer()
                Text("MonDee")
                    .font(.system(.body, design: .rounded, weight: .bold))
                    .foregroundColor(.mondeeMint)
                Spacer()
                
            }
            .frame(height: 500)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.mondeeDarkBlue).opacity(0.5)
                    .backgroundBlurEffect().cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 8)
            )
            .padding(.horizontal, 24)
            .padding(.bottom)
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
