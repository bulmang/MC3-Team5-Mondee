//
//  ButtonSystem.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/24.
//

import SwiftUI

/// 사용 예시
struct ButtonSystem: View {
    var body: some View {
        VStack {
            MondeeBlueButton(label: "다음") {
                // action here
            }
            HStack {
                MondeeGreyButton(label: "먼디") {
                    // action here
                }
                MondeeBlueButton(label: "먼디") {
                    // action here
                }
            }
        }
        .padding()
    }
}

struct MondeeBlueButton: View {
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
        }
        .buttonStyle(MondeeButtonStyle(color: .mondeeBlue))
    }
}

struct MondeeGreyButton: View {
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
        }
        .buttonStyle(MondeeButtonStyle(color: .mondeeGrey))
    }
}

struct MondeeButtonStyle: ButtonStyle {
    
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Capsule()
                    .fill(color)
            )
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
    }
}

struct ButtonSystem_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSystem()
    }
}
