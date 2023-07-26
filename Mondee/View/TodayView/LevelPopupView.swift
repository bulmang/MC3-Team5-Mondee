//
//  LevelPopupView.swift
//  Mondee
//
//  Created by woozu on 2023/07/25.
//

import SwiftUI

struct LevelPopupView: View {

    let LevelMondee : [LevelPopupViewModel] = [
        .init( mondeeImg: "ImgMondeeLevel1-IOS", mondeeTitle:"청응애" , mondeeContents: "응애 나 아기먼디"),
        .init( mondeeImg: "ImgMondeeLevel2-IOS", mondeeTitle:"청린이" , mondeeContents: "청소 4번 성공 시"),
        .init( mondeeImg: "ImgMondeeLevel3-IOS", mondeeTitle:"청년" , mondeeContents: "청소 8번 성공 시"),
        .init( mondeeImg: "ImgMondeeLevel4-IOS", mondeeTitle:"청른이" , mondeeContents: "청소 12번 성공 시"),
        .init( mondeeImg: "ImgMondeeLevel5-IOS", mondeeTitle:"청고수" , mondeeContents: "청소 20번 성공 시")
    ]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(LevelMondee) { level in
               
                HStack{
                    Image(level.mondeeImg)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .padding()
                    VStack(alignment: .leading){
                        Text(level.mondeeTitle)
                            .font(.title3)
                            .fontWeight(.bold)
                           
                        Text(level.mondeeContents)
                    }
                }
                .padding(.trailing,100)
            }
        }
    }
}
struct LevelPopupView_Previews: PreviewProvider {
    static var previews: some View {
        LevelPopupView()
    }
}
