//
//  SharingCardView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/28.
//

import SwiftUI

struct SharingCardView: View {
    let selection: Int
    let imageName: String
    let cleaningTime: Int
    
    var body: some View {
        ZStack {
            if selection == 0 {
                SharingCard1View(cleaningTime: cleaningTime)
            } else if selection == 1 {
                SharingCard2View()
            }
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.top)
        }
    }
}

struct SharingCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            SharingCardView(selection: 0, imageName: "ImgMondeeLevel1-IOS", cleaningTime: 120)
        }
    }
}
