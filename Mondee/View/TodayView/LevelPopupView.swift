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
        ZStack {
            Color("mondeeBackgroundGrey")

            VStack(spacing: 0.0) {
                
                Text("청소 장인")
                    .font(.title)
                    .fontWeight(.bold)
                Text("청소 성공 횟수에 따라")
                Text("레벨이 올라가요!")
                    .padding(.bottom,20)
                Rectangle()
                    .frame(height: 1.0)
                    .opacity(/*@START_MENU_TOKEN@*/0.2/*@END_MENU_TOKEN@*/)
                
                 
                
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
            .frame(width: 358.0, height: 600.0)
            .background()
            .cornerRadius(25)
        }
    }
}
struct LevelPopupView_Previews: PreviewProvider {
    static var previews: some View {
        LevelPopupView()
    }
}
