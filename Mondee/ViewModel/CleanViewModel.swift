//
//  CleanViewModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/25.
//

import SwiftUI

class collectedMondeeModel: ObservableObject {
    @Published var collectedMondees: [CollectedMondee] = [
        CollectedMondee(index: 1, collectedMondeeName: "푸딩먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee001-IOS", isCollected: true),
        CollectedMondee(index: 2, collectedMondeeName: "사탕먼디", collectedMondeeDate: nil, collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee002-IOS", isCollected: true),
        CollectedMondee(index: 3, collectedMondeeName: "선디", collectedMondeeDate: Date() - 10000000000000000, collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgMondeeLevel1-IOS", isCollected: false),
        CollectedMondee(index: 4, collectedMondeeName: "오너먼트먼디", collectedMondeeDate: nil, collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee003-IOS", isCollected: true),
        CollectedMondee(index: 5, collectedMondeeName: "화분먼디", collectedMondeeDate: Date() - 1000000000, collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee005-IOS", isCollected: false),
        CollectedMondee(index: 6, collectedMondeeName: "시즈먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgMondeeLevel1-IOS", isCollected: false),
        CollectedMondee(index: 7, collectedMondeeName: "핑크먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee004-IOS", isCollected: true),
        CollectedMondee(index: 8, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 9, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 10, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 11, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 12, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 13, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 14, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 15, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 16, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 17, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 18, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 19, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true),
        CollectedMondee(index: 20, collectedMondeeName: "실버먼디", collectedMondeeDate: Date(), collectedMondeeDescription: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", collectedMondeeImg: "ImgCollectedMondee006-IOS", isCollected: true)
    ]
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
