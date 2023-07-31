//
//  CleanViewModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/25.
//

import SwiftUI

class CollectedMondeeModel: ObservableObject {
    @StateObject var data = PhoneDataModel.shared
    
    @Published var collectedMondees: [CollectedMondee] = []
    
    init() {
        let mondeeList = mondeeList
        
        let mondeeLogData = data.mondeeLogData
        let mondeeLogList = mondeeLogData.mondeeLog
        
        self.collectedMondees = mondeeList.map { mondee in
            let isCollected = mondeeLogList.contains { $0.mondee.name == mondee.name }
            
            return CollectedMondee(collectedMondeeName: mondee.name,
                                   collectedMondeeDate: mondeeLogList.first { $0.mondee.name == mondee.name }?.date,
                                   collectedMondeeDescription: mondee.description,
                                   collectedMondeeImg: mondee.mondeeImg,
                                   isCollected: isCollected)
        }
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader {geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                action(value)
            }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

extension View {
    func backgroundBlurEffect() -> some View {
        self.background(BlurView())
    }
}
