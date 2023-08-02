//
//  CleanRoomView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct CleanRoomView: View {
    
    @State private var scrollViewOffset: CGFloat = 0
    @State private var collectedMondeeName = ""
    
    
    @Binding var isDetailCardPopUp: Bool
    @Binding var collectedMondee: CollectedMondee
    @StateObject private var collectedModel = CollectedMondeeModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.mondeeBoxBackground.ignoresSafeArea()
                .frame(height: scrollViewOffset > 0 ? scrollViewOffset : 0)
            ScrollView {
                VStack {
                    LargeNavigationTitle(scrollViewOffset: $scrollViewOffset,title: "멸균실",subTitle: "획득한 먼지들을 확인해보세요")
                    
                    LatestCollectedMondeeView(collectedModel: collectedModel)
                    
                    CollectedMondeeGridView(isDetailCardPopUp: $isDetailCardPopUp, collected: $collectedMondee, collectedModel: collectedModel)
                }
            }
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 0) }
            .safeAreaInset(edge: .top) { Color.clear.frame(height: 30) }
            .overlay(alignment: .top) {
                InlineNavigationTitle(scrollViewOffset: scrollViewOffset,title: "멸균실")
            }
        }
    }
}

struct LargeNavigationTitle: View {
    @Binding var scrollViewOffset: CGFloat
    
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.mondeeBlue)
            Text(subTitle)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .opacity(Double(scrollViewOffset / 30 - 0.83))
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 20, trailing: 40))
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.mondeeBoxBackground)
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
        )
        .onScrollViewOffsetChanged { value in
            scrollViewOffset = value
        }
    }
}

struct InlineNavigationTitle: View {
    var scrollViewOffset: CGFloat
    
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.mondeeBlue)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .black.opacity(0.15), radius: 4, y: 4)
        )
        .opacity(scrollViewOffset < 23 ? 1 : 0)
    }
}

struct CleanRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            CleanRoomView(isDetailCardPopUp: .constant(false), collectedMondee: .constant(CollectedMondee(collectedMondeeName: "", collectedMondeeDate: Date(), collectedMondeeDescription: "", collectedMondeeImg: "", isCollected: false)))
        }
    }
}
