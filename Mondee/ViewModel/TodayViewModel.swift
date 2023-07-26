//
//  TodayViewModel.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/25.
//

import Foundation

class TodayViewModel: ObservableObject {
    @Published var successCount: Int = 8
    
    private let levelList = [
        Level(name: "청응애", startNumber: 0, endNumber: 3, mondeeImg: "ImgMondeeLevel1-IOS", nextLevelMessage: "청린이가 되기까기"),
        Level(name: "청린이", startNumber: 4, endNumber: 7, mondeeImg: "ImgMondeeLevel2-IOS", nextLevelMessage: "청년이 되기까기"),
        Level(name: "청년", startNumber: 8, endNumber: 11, mondeeImg: "ImgMondeeLevel3-IOS", nextLevelMessage: "청른이가 되기까기"),
        Level(name: "청른이", startNumber: 12, endNumber: 15, mondeeImg: "ImgMondeeLevel4-IOS", nextLevelMessage: "청고수가 되기까기"),
        Level(name: "청고수", startNumber: 16, endNumber: 16, mondeeImg: "ImgMondeeLevel5-IOS", nextLevelMessage: "이게 바로 고수의 삶")
    ]
    
    var currentLevel: Level {
        for level in levelList {
            if successCount >= level.startNumber && successCount <= level.endNumber {
                return level
            }
        }
        return levelList.last!
    }
}
