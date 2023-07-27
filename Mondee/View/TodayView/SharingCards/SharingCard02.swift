//
//  SharingCard02.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/27.
//

import SwiftUI

struct SharingCard02: View {
    var body: some View {
        ZStack {
            Image("sharingCard02")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
        
    }
}

struct SharingCard02_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            SharingCard02()
        }
    }
}
