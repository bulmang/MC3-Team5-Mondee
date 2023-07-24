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
    var gamePlayTime: Int
    var remainingHeartCount: Int
}

enum MessageKey: String {
    case isSuccess = "isSuccess"
    case gamePlayDate = "gamePlayDate"
    
    case gameStart = "gameStart"
    case gamePause = "gamePause"

    case isRetry = "isRetry"
    case gamePlayTime = "gamePlayTime"
    case remainingHeartCount = "remainingHeartCount"
}

