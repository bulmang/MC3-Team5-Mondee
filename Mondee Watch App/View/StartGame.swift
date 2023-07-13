//
//  StartGame.swift
//  Mondee Watch App
//
//  Created by 하명관 on 2023/07/13.
//

import SwiftUI

struct StartGame: View {
    
    // MARK: Properties
    @State var mondeeScroll: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geo in
            
            let deviceHeight = geo.size.height
            let deviceWidth = geo.size.width
            let mondeeWidth = deviceWidth-100
            
            NavigationView {
                ZStack(alignment: .top) {
                    // MARK: MONDEE
                    VStack {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                            Image("ImgWatchMondee")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: mondeeWidth)
                                .offset(y: mondeeScroll <= -330 ? deviceHeight/2.5 : -((self.mondeeScroll)/6))
                                .focusable(isFocusable)
                                .digitalCrownRotation($mondeeScroll,from:-330,through:150)
                        }
                    }
                    .navigationTitle {
                        HStack {
                            Text("Mondee")
                                .foregroundColor(.mint)
                                .fontDesign(.rounded)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.hidden)
                    .ignoresSafeArea(.all)
                    
                    // MARK: BATH IMAGE
                    VStack {
                        Spacer()
                        Image("ImgWatchBath")
                                .resizable()
                                .frame(maxWidth: deviceWidth)
                    }
                    
                    // MARK: ARROW ANIMATION
                    HStack {
                        Spacer()
                        ArrowAnimation()
                    }
                    .opacity(opacityValue)
                }
                .padding(.top,50)
                .ignoresSafeArea()
            }
        }
    }
    
    // MARK: Computed Properties
    
    private var isFocusable: Bool {
        return mondeeScroll > -260
    }
    
    private var offsetValue: (CGFloat) -> CGFloat {
        return { deviceHeight in
            return self.mondeeScroll <= -260 ? deviceHeight/3.5 : -((self.mondeeScroll+38))
        }
    }
    
    private var opacityValue: Double {
        return mondeeScroll <= -260 ? 0 : 1
    }
    
    private func shouldShowGuideView() -> Binding<Bool>? {
        return mondeeScroll < -270 ? Binding.constant(true) : nil
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        StartGame()
    }
}
