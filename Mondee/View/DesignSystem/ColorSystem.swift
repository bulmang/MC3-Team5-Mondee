//
//  ColorSystem.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/24.
//

import SwiftUI

/// 쓰는 방법 .foregroundColor(.mondeePrimary)
extension Color {
    
    // MARK: 먼디앱에 쓰이는 메인 색상
    
    static let mondeeBlue = Color("mondeeBlue")
    static let mondeeMint = Color("mondeeMint")
    static let mondeeGrey = Color("mondeeGrey")
    
    // MARK: 먼디 시스템 컬러

    /// 먼디 앱 배경화면
    static let mondeeBackgroundGrey = Color("mondeeBackgroundGrey")
    /// 먼디 캐릭터가 들어가는 박스 색상
    static let mondeeBoxBackground = Color("mondeeBoxBackground")
    /// 먼디 캐릭터 클릭 시 나오는 말풍선 색상
    static let mondeeSpeechBubble = Color("mondeeSpeechBubble")

    static let mondeeDarkGrey = Color("mondeeDarkGrey")
    
    static let mondeeDarkBlue = Color("mondeeDarkBlue")

}
