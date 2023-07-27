//
//  CleanRoomView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct CleanRoomView: View {
    
    @State private var scrollViewOffset: CGFloat = 0
    @State private var isDetailCardPopUp = false
    @State private var collectedMondeeName = ""
    
    @State private var collectedMondee: CollectedMondee = CollectedMondee(index: 0, collectedMondeeName: "", collectedMondeeDate: Date(), collectedMondeeDescription: "", collectedMondeeImg: "", isCollected: false)
    
    @StateObject private var collectedModel = collectedMondeeModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.mondeeBoxBackground.ignoresSafeArea()
                .frame(height: scrollViewOffset > 0 ? scrollViewOffset : 0)
            ScrollView {
                VStack {
                    LargeNavigationTitle(scrollViewOffset: $scrollViewOffset)
                    
                    LatestCollectedMondeeView(collectedModel: collectedModel)
                    
                    CollectedMondeeGridView(isDetailCardPopUp: $isDetailCardPopUp, collected: $collectedMondee, collectedModel: collectedModel)
                }
            }
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 43) }
            .safeAreaInset(edge: .top) { Color.clear.frame(height: 30) }
            .overlay(alignment: .top) {
                InlineNavigationTitle(scrollViewOffset: scrollViewOffset)
            }
            .blur(radius: isDetailCardPopUp ? 2 : 0)
//            .sheet(isPresented: $isDetailCardPopUp) {
//                CollectedMondeeDetailCardView(isDetailCardPopUp: $isDetailCardPopUp)
//            }
            if isDetailCardPopUp {
                CollectedMondeeDetailCardView(isDetailCardPopUp: $isDetailCardPopUp, collected: $collectedMondee)
                    .transition(.opacity)
            }
        }
    }
}

struct LargeNavigationTitle: View {
    
    @Binding var scrollViewOffset: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("멸균실")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.mondeeBlue)
            Text("획득한 먼지들을 확인해보세요")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .opacity(Double(scrollViewOffset / 40 - 0.65))
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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("멸균실")
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
            CleanRoomView()
        }
    }
}
