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
    
    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.95, blue: 0.98).ignoresSafeArea()
            VStack {
                Text("오늘 획득한 먼디를 자랑해보세요!")
                SaveView()
                    .padding()
                    .onAppear {
                        let renderer = ImageRenderer(content: SaveView())
                        renderer.scale = 3
                        
                        if let image = renderer.cgImage {
                            renderedImage = Image(decorative: image, scale: 1.0)
                        }
                    }
                
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 44)
                            Text("🫧")
                                .bold()
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 44)
                                .opacity(0.5)
                            Text("☁️")
                                .bold()
                        }
                    }
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 44)
                                .opacity(0.5)
                            Text("👽")
                                .bold()
                        }
                    }
                }
                Spacer()
                HStack {
                    Button {
                        let ren = ImageRenderer(content: SaveView())
                        ren.scale = 3
                        if let image = ren.uiImage {
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
                    } label: {
                        Text("사진 저장하기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(
                                Capsule()
                            )
                            .tint(.gray)
                    }
                    ShareLink(item: renderedImage, preview: SharePreview(Text("먼디를 자랑해 보세요!"), image: renderedImage)) {
                        Text("공유하기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(
                                Capsule()
                            )
                            .tint(.blue)
                    }
                }
            }
            .padding()
        }
    }
}

struct SaveView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(.white)
                .frame(height: 400)
            VStack {
                VStack(alignment: .leading) {
                    Text("외계 먼지")
                        .font(.title2)
                    Text("오늘의 획득 먼지")
                }
                .padding()
                Circle()
                    .frame(width: 100)
                Text("청소성공")
                    .padding()
            }
            .frame(height: 400)
        }
    }
}

/// 뷰를 위한 NavigationStack 입니다. 실제는 ShareView 만 가져다쓰면 됩니다.
struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NavigationLink {
                ShareView()
            } label: {
                HStack {
                    Text("오늘의 먼디 자랑하기")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
            }
            .buttonStyle(.plain)
            .background(
                Capsule()
                    .foregroundStyle(.thinMaterial)
            )
            .padding()
            .navigationTitle("")
        }
        .tint(.blue)
    }
}
