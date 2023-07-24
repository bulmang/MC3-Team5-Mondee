//
//  ContentView.swift
//  Onboarding
//
//  Created by Sunjoo IM on 2023/07/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 1)
            
            ScrollView {
                LazyVStack {
                    
                    Group {
                        Spacer()
                            .frame(height: 250)
                        VStack {
                            Text("먼디를 구해줘!")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .bold()
                                .padding()
                            Text("글.그림 먼디를 만든 사람들")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding()
                        }
                    }
                    Group {
                        Spacer()
                            .frame(height: 100)
                        VStack {
                            VStack(spacing: 5) {
                                Text("앗! 방청소를 너무 미룬 나머지")
                                Text("먼디가 원래 모습을 잃어버렸어요..")
                            }
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .padding(.vertical, 30)
                            .frame(maxWidth: .infinity)
                            .border(.black)
                            Spacer()
                                .frame(height: 60)
                            Image("onboarding-cut-1")
                                .resizable()
                                .scaledToFit()
                        }
                        .padding()
                    }
                    Group {
                        Spacer()
                            .frame(height: 120)
                        VStack {
                            HStack {
                                VStack {
                                    Text("그 때!")
                                    Text("애플워치를 차고")
                                    Text("방청소를 시작했더니...")
                                }
                                .foregroundColor(.black)
                                .font(.system(size: 22))
                                .padding(30)
                                //                            .frame(maxWidth: 280)
                                .border(.black)
                                Spacer()
                            }
                            .padding(.leading, 40)
                            Image("onboarding-cut-2")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    Group {
                        Spacer()
                            .frame(height: 120)
                        VStack {
                            HStack {
                                Spacer()
                                VStack {
                                    Text("드디어 먼지 더미에서")
                                    Text("해방된 우리의 먼디!!")
                                }
                                .foregroundColor(.black)
                                .font(.system(size: 22))
                                .padding(30)
                                //                            .frame(maxWidth: 250)
                                .border(.black)
                            }
                            .padding(.trailing)
                            Image("onboarding-cut-3")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding()
                    Group {
                        Spacer()
                            .frame(height: 120)
                        VStack {
                            VStack {
                                Text("방청소를 하며")
                                Text("매일 새로운 먼디를 만나보세요!")
                            }
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .padding(.vertical, 30)
                            .frame(maxWidth: .infinity)
                            .border(.black)
                            Spacer()
                                .frame(height: 50)
                            Image("onboarding-cut-4")
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                        Spacer()
                            .frame(height: 50)
                    }
                    .padding()
                    
                    Button(action: {
                        isOnboarding = false
                    }) {
                        Text("시작하기")
                    }
                    
                }
                
                Spacer()
            }
        }
        .background(.white)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: OnboardingView().preferredColorScheme)
    }
}
