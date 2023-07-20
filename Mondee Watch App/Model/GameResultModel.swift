//
//  GameResultModel.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/16.
//

import Foundation

struct GameResultData {
    var isSuccess: Bool
    var gamePlayDate: Date
    
    var gameStart: Bool
    var gamePause: Bool
    
    var isRetry: Bool
    var remainingHeartCount: Int
    var gamePlayTime: Int
    var totalDistanceMoved: Double
}

enum MessageKey: String {
    case isSuccess = "isSuccess"
    case gamePlayDate = "gamePlayDate"
    
    case gameStart = "gameStart"
    case gamePause = "gamePause"

    case isRetry = "isRetry"
    case remainingHeartCount = "remainingHeartCount"
    case gamePlayTime = "gamePlayTime"
    case totalDistanceMoved = "totalDistanceMoved"
}

