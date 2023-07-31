//
//  SharingCard2View.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/27.
//

import SwiftUI

struct SharingCard2View: View {
    
    var body: some View {
        ZStack {
            Image("sharingCardBackground")
                .resizable()
                .scaledToFit()
                .frame(width: 320)
        }
        
    }
}

struct SharingCardCloudBackground_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            SharingCard2View()
        }
    }
}
