//
//  CollectedMondeeGridView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import SwiftUI

struct CollectedMondeeGridView: View {
    @Binding var isDetailCardPopUp: Bool
    @Binding var test: Int
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0..<30) { i in
                Button {
                    withAnimation() {
                        isDetailCardPopUp = true
                    }
                    test = i
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 86)
                            .foregroundColor(Color(.systemGray6))
                        Image(systemName: "lock.fill")
                            .font(.system(.largeTitle, weight: .bold))
                            .foregroundColor(.mondeeGrey)
                    }
                }
                .buttonStyle(MondeeButtonClickStyle())
            }
        }
        .padding(.vertical, 8)
        .padding(17)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.mondeeBoxBackground)
        )
        .padding(.top, 5)
        .padding(.bottom, 24)
        .padding(.horizontal, 19)
    }
}

struct CollectedMondeeGridView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            ScrollView {
                CollectedMondeeGridView(isDetailCardPopUp: .constant(false), test: .constant(1))
            }
        }
    }
}
