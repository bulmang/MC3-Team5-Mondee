//
//  SharingCardView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/28.
//

import SwiftUI

struct SharingCardView: View {
    let selection: Int
    
    var body: some View {
        ZStack {
            if selection == 0 {
                SharingCard01()
            } else if selection == 1 {
                SharingCard02()
            }
            Image("ImgMondeeLevel1-IOS")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.top)
            if selection == 0 {
                Image("sharingCard01_Bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230)
            }
        }
    }
}

struct SharingCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            SharingCardView(selection: 0)
        }
    }
}
