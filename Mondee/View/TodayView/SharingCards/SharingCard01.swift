//
//  SharingCard01.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/27.
//

import SwiftUI

struct SharingCard01: View {
    
    private var isSuceess = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(Color.mondeeBoxBackground)
                .frame(width: 300, height: 406.1)
            Rectangle()
                .frame(width: 4, height: 50)
                .foregroundColor(.mondeeBlue)
                .padding(.leading, 20)
            VStack(alignment: .leading, spacing: 5) {
                if isSuceess {
                    Text("Today's\ncleaning success!")
                        .foregroundColor(.mondeeBlue)
                        .font(.system(size: 22, weight: .bold))
                    Text("청소 소요 시간 - 9분 8초")
                        .foregroundColor(.mondeeBlue)
                        .font(.system(size: 14, weight: .bold))
                } else {
                    Text("No\ncleanup yet")
                        .foregroundColor(.mondeeBlue)
                        .font(.system(size: 22, weight: .bold))
                    Text("청소 소요 시간 - 측정 안됨")
                        .foregroundColor(.mondeeBlue)
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .padding(30)
            Text("MonDee")
                .font(.system(size: 15))
                .offset(x: 35, y: 10)
                .foregroundColor(.mondeeBlue)
                .rotationEffect(Angle(degrees: 270))
                .frame(width: 300, height: 406.1, alignment: .bottomTrailing)
        }
    }
}

struct SharingCard01_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            SharingCard01()
        }
    }
}
