//
//  RecordTitleArea.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/24.
//

import SwiftUI

struct RecordTitleArea: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 22)
            .frame(maxWidth: .infinity)
            .frame(height: 163)
            .foregroundColor(.white)
            .overlay(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Spacer()
                    Text("연속 성공 3일차🎉")
                        .font(.system(size: 27, weight: .bold))
                        .padding(.bottom,7)
                    Text("성공 버블을 모아보세요")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("ColorFontGray"))
                        .padding(.bottom, 25)
                }
                .padding(.leading, 42)
                
            }
    }
}

struct RecordTitleArea_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBgLight")
            RecordTitleArea()
        }
    }
}
