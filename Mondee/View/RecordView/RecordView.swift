//
//  RecordView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        ZStack{
            Color("ColorBgLight")
            VStack{
                RoundedRectangle(cornerRadius: 22)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .foregroundColor(.white)
                    .overlay(
                        Text("연속 성공 3일차🎉")
                    )
            }
        }
        .ignoresSafeArea()
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
