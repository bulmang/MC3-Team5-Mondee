//
//  Modifier.swift
//  Mondee Watch App
//
//  Created by seunghoria on 2023/07/18.
//

import SwiftUI

struct BubbleFont: View {
    var body: some View {
        ZStack {
            Color.black
            Text("2")
                .font(.system(size: 150))
                .modifier(BubbleFontModifier())
        }
    }
}

struct BubbleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.black)
            .fontDesign(.rounded)
            .foregroundStyle(
                Color.black
                    .shadow(.inner(color: .purple.opacity(0.4), radius: 2, x: 4, y: 4))
                .shadow(.inner(color: .blue, radius: 2, x: -2, y: 2))
                .shadow(.inner(color: .yellow.opacity(0.4), radius: 4, x: 1.5, y: -2))
                .shadow(.inner(color: .white.opacity(0.5), radius: 4, x: 0, y: 8))
                .shadow(.inner(color: .white, radius: 1))
            )
            
    }
}

struct BubbleFont_Previews: PreviewProvider {
    static var previews: some View {
        BubbleFont()
    }
}
