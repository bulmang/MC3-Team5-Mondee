//
//  CleanRoomView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct CleanRoomView: View {
    
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            LargeNavigationTitle(scrollViewOffset: $scrollViewOffset)
            
            LatestCollectedMondeeView()
            
            CollectedMondeeGridView()
        }
        .edgesIgnoringSafeArea(.top)
        //      .overlay (Text("\(scrollViewOffset)"))
        .overlay(alignment: .top) {
            InlineNavigationTitle(scrollViewOffset: scrollViewOffset)
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
        .ignoresSafeArea()
        .opacity(1 - Double(-scrollViewOffset) / 60)
        .padding(EdgeInsets(top: 75, leading: 40, bottom: 20, trailing: 40))
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.mondeeBoxBackground)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
        )
        .onScrollViewOffsetChanged { value in
            scrollViewOffset = value
        }
        .opacity(scrollViewOffset < -55 ? 0 : 1)
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
                .fill(Color.mondeeBoxBackground.opacity(0.9))
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
        )
        .opacity(scrollViewOffset < -55 ? 1 : 0)
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
