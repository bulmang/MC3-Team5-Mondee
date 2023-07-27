//
//  ShareView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/22.
//

import SwiftUI

struct ShareView: View {
    
    @State private var renderedImage = Image(systemName: "photo")
    @State private var r: Image?
    
    @State private var selection = 0
    @State private var toastAnimation = false
    
    @Namespace private var namespace
    
    var body: some View {
        ZStack {
            Color.mondeeBackgroundGrey.ignoresSafeArea()
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    Text("오늘 획득한 먼디를 자랑해보세요!")
                        .font(.title3)
                        .fontWeight(.medium)
                    SharingCardView(selection: $selection)
                        .onAppear {
                            let renderer = ImageRenderer(content: SharingCardView(selection: $selection))
                            renderer.scale = 3
                            
                            if let image = renderer.cgImage {
                                renderedImage = Image(decorative: image, scale: 1.0)
                            }
                        }
                        .cornerRadius(20)
                        .shadow(radius: 4, y: 4)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                HStack(spacing: 20) {
                    Button {
                        withAnimation() {
                            selection = 0
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.mondeeBlue)
                                .frame(width: 44)
                                .opacity(0.2)
                            if selection == 0 {
                                Circle()
                                    .foregroundColor(.mondeeBlue)
                                    .frame(width: 44)
                                    .opacity(0.7)
                                    .matchedGeometryEffect(id: "shareTab", in: namespace)
                            }
                            Image("sharingCardBubbleButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23)
                                .bold()
                        }
                    }
                    Button {
                        withAnimation() {
                            selection = 1
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.mondeeBlue)
                                .frame(width: 44)
                                .opacity(0.2)
                            if selection == 1 {
                                Circle()
                                    .foregroundColor(.mondeeBlue)
                                    .frame(width: 44)
                                    .opacity(0.7)
                                    .matchedGeometryEffect(id: "shareTab", in: namespace)
                            }
                            Image("sharingCardCloudButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26)
                        }
                    }
                }
                Spacer()
                Spacer()
                HStack(spacing: 12) {
                    Button {
                        let ren = ImageRenderer(content: SharingCardView(selection: $selection))
                        ren.scale = 3
                        if let image = ren.uiImage {
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
                        withAnimation(.easeInOut(duration: 0.8)) {
                            toastAnimation = true
                        }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeInOut(duration: 2)) {
                                toastAnimation = false
                            }
                        }
                    } label: {
                        Text("사진 저장하기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(
                                Capsule()
                                    .foregroundColor(.mondeeGrey)
                            )
                    }
                    .buttonStyle(MondeeButtonClickStyle())
                    
                    ShareLink(item: renderedImage, preview: SharePreview(Text("먼디를 자랑해 보세요!"), image: renderedImage)) {
                        Text("공유하기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(
                                Capsule()
                                    .foregroundColor(.mondeeBlue)
                            )
                    }
                    .buttonStyle(MondeeButtonClickStyle())
                }
                .padding(.vertical, 5)
            }
            .padding()
        }
        .overlay {
            if toastAnimation {
                toastBox(text: "사진이 저장되었습니다")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .transition(.move(edge: .top))
                    .offset(y: -30)
            }
        }
    }
    
    @ViewBuilder
    private func toastBox(text: String) -> some View {
        Text(text)
            .padding()
            .background(
                Capsule().foregroundColor(.mondeeBackgroundGrey)
                    .shadow(radius: 2)
            )
    }
}

struct Toast: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(
                Capsule().foregroundColor(.mondeeBackgroundGrey)
                    .shadow(radius: 2)
            )
    }
}

/// 뷰를 위한 NavigationStack 입니다. 실제는 ShareView 만 가져다쓰면 됩니다.
struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
                ShareView()
    }
}
