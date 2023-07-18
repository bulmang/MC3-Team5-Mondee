//
//  Constants.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

struct Constants {
    static let initialSeconds = 600
    static let initialHeartCount = 3
    static let warningThreshold = 20 // 경고 임계값
    static let dirtThreshold = 25 // 캐릭터가 더러워지는 임계값
    static let cleanThreshold = 10 // 캐릭터가 다시 깨끗해지는 임계값
    static let terminationPossibleSeconds = 20 // 조기 종료 가능 최소시간
}
