//
//  FinalFailView.swift
//  Mondee Watch App
//
//  Created by hyunjun on 2023/07/18.
//

import SwiftUI

struct FinalFailView: View {
    var body: some View {
        VStack{
            Image("ImgFail-WatchOS")
                .resizable()
                .frame(width: 76,height: 75)
            Text("오늘은 끝났어요...")
                .font(.body)
                .fontWeight(.medium)
                .padding(.top,20)
        }
        .padding(.top,20)
    }
}

struct FinalFailView_Previews: PreviewProvider {
    static var previews: some View {
        FinalFailView()
    }
}
