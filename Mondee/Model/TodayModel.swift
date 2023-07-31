//
//  TodayModel.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/25.
//

import Foundation

enum GameStatus {
    case noStatus
    case notStarted
    case inProgress
    case paused
    case finishedSuccess
    case finishedFail
}

struct Level {
    let name: String
    let startNumber: Int
    let endNumber: Int
    let mondeeImg: String
    let nextLevelMessage: String
}

struct LevelInfo : Identifiable {
    let id = UUID()
    let mondeeImg: String
    let mondeeTitle: String
    let mondeeContents: String
}

let levelList = [
    Level(name: "청응애", startNumber: 0, endNumber: 3, mondeeImg: "ImgMondeeLevel1-IOS", nextLevelMessage: "청린이가 되기까기"),
    Level(name: "청린이", startNumber: 4, endNumber: 7, mondeeImg: "ImgMondeeLevel2-IOS", nextLevelMessage: "청년이 되기까기"),
    Level(name: "청년", startNumber: 8, endNumber: 11, mondeeImg: "ImgMondeeLevel3-IOS", nextLevelMessage: "청른이가 되기까기"),
    Level(name: "청른이", startNumber: 12, endNumber: 15, mondeeImg: "ImgMondeeLevel4-IOS", nextLevelMessage: "청고수가 되기까기"),
    Level(name: "청고수", startNumber: 16, endNumber: 16, mondeeImg: "ImgMondeeLevel5-IOS", nextLevelMessage: "이게 바로 고수의 삶")
]

let cleanMondeeLines = [
    "🤤 후 물맛 좋네",
    "😋 77ㅓ억~",
    "♨️ 사실 더 지지고싶었어",
    "💧 이 집 물 맛집이네",
    "🛁 여기 물이 좋다니까",
    "🥸 왜 계속 찔러 너 나 좋아해?",
    "✨ 청소 좀 치는데?"
]

let dirtyMondeeLines = [
    "🚿 시원~하게 등목 때리고싶자너",
    "🧼 나도 씻겨줘잉",
    "🙃 오늘은 청소.. 할거지?",
    "🧽 청소 갈겨~~ 샤워 갈겨~~",
    "🤔 누가 샤워 안시켜주나?ㅎ",
    "🩹 반창고? 눈썹 잘못 깎았어",
    "🥸 왜 계속 찔러 너 나 좋아해?"
]
