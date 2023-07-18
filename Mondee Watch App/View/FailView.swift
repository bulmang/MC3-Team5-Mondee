//
//  FailView.swift
//  Mondee Watch App
//
//  Created by woozu on 2023/07/14.
//

import SwiftUI

struct FailView: View {
    var body: some View {
        VStack{
            Image("ImgFail-WatchOS")
                .resizable()
                .frame(width: 76,height: 75)
            Text("더 씻겨주세요")
                .font(.body)
                .fontWeight(.medium)
            Button("다시 도전"){
                //action
                
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(hue: 0.593, saturation: 0.893, brightness: 0.876, opacity: 0.827))
            
            Button("오늘은 그만"){
                //action
            }
            
        }
        .padding(.top,20)
        }
    }


struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
    }
}
