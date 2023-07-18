//
//  SuccessView.swift
//  Mondee Watch App
//
//  Created by woozu on 2023/07/14.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack{
            ZStack{
                Image("ImgSuccess-WatchOS")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(.bottom,40)
                Text("오늘의 먼지")
                    .font(.body)
                    .fontWeight(.medium)
                    .padding(.top,90)
                
                Text("어플에서 확인해보세요")
                    .font(.body)
                    .fontWeight(.medium)
                    .padding(.top,125)
                
            }
            
            Button("청소 성공"){
                //action
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
