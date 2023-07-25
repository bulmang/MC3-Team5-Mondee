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
        ZStack {
            Color.mondeeBoxBackground.ignoresSafeArea()
            ScrollView {
                ZStack {
                    Color.gray
                    VStack {
                        Header
                            .opacity(1 - Double(-scrollViewOffset) / 100)
                            .onScrollViewOffsetChanged { value in
                                self.scrollViewOffset = value
                            }
                        Rectangle()
                            .frame(height: 400)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(height: 400)
                            .foregroundColor(.white)
                        
                        Rectangle()
                            .frame(height: 400)
                            .foregroundColor(.white)
                    }
                }
            }
            .overlay (Text("\(scrollViewOffset)"))
            .overlay(alignment: .top) {
                navigationBar.opacity(scrollViewOffset < -60 ? 1 : 0)
                    .animation(.easeInOut, value: scrollViewOffset)
            }
        }
    }
}

extension CleanRoomView {
    
    private var navigationBar: some View {
        VStack(alignment: .leading) {
            Text("멸균실")
                .font(.headline)
                .foregroundColor(.mondeeBlue)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.mondeeBoxBackground)
                .ignoresSafeArea()
        )
    }
    
    private var Header: some View {
        VStack(alignment: .leading) {
            Text("멸균실")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.mondeeBlue)
            Text("획득한 먼지들을 확인해보세요")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.mondeeBoxBackground)
                .ignoresSafeArea()
        )
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

struct CleanRoomView_Previews: PreviewProvider {
    static var previews: some View {
        CleanRoomView()
    }
}
