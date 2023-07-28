//
//  SharingCard1View.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/27.
//

import SwiftUI

struct SharingCard1View: View {
    
    private var isSuceess = true
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(Color.mondeeBoxBackground)
                .frame(width: 320, height: 320)
            VStack(alignment: .leading, spacing: 5) {
                if isSuceess {
                    Text("Today's\ncleaning success!")
                        .foregroundColor(.mondeeBlue)
                        .font(.system(size: 24, weight: .bold))
                } else {
                    Text("No\ncleanup yet")
                        .foregroundColor(.mondeeBlue)
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .padding(20)
            if isSuceess {
                Text("Cleaning Time\n09:38")
                    .font(.system(size: 14))
                    .bold()
                    .offset(x: 45, y: -15)
                    .foregroundColor(.mondeeBlue)
                    .rotationEffect(Angle(degrees: 270))
                    .frame(width: 320, height: 320, alignment: .bottomLeading)
            }
            VStack(spacing: -10) {
                Image("sharingCardMondeeText")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 210)
            }
            .padding(.trailing, 10)
            .frame(width: 320, height: 320, alignment: .bottomTrailing)
            
        }
    }
}

struct SharingCard1View_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            SharingCard1View()
        }
    }
}
