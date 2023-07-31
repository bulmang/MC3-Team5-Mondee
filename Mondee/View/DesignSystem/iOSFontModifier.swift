//
//  iOSFontModifier.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/31.
//

import SwiftUI

struct iOSFontModifier: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .iOSbubbleFontModifier()
    }
}

struct iOSBubbleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.black)
            .fontDesign(.rounded)
            .foregroundStyle(
                Color.mondeeBoxBackground
                    .shadow(.inner(color: Color(UIColor.magenta).opacity(0.4), radius: 2, x: 2, y: 2))
                    .shadow(.inner(color: .blue, radius: 2, x: -1, y: 1))
                    .shadow(.inner(color: .yellow.opacity(0.4), radius: 4, x: 1.5, y: -1))
                    .shadow(.inner(color: .white.opacity(0.5), radius: 4, x: 0, y: 4))
                    .shadow(.inner(color: .white, radius: 0.5))
            )
    }
}

extension View {
    func iOSbubbleFontModifier() -> some View {
        modifier(iOSBubbleFontModifier())
    }
}

struct iOSFontModifier_Previews: PreviewProvider {
    static var previews: some View {
        iOSFontModifier()
    }
}
