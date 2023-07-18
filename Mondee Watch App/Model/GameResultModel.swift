//
//  GameResultModel.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/16.
//

import Foundation

struct GameResultData {
    var isSuccess: Bool
    var retryCount: Int
    var remainingHeartCount: Int
    var gamePlayDate: Date
    var gamePlayTime: Int
    var totalDistanceMoved: Double
}

enum MessageKey: String {
    case isSuccess = "isSuccess"
    case retryCount = "retryCount"
    case remainingHeartCount = "remainingHeartCount"
    case gamePlayDate = "gamePlayDate"
    case gamePlayTime = "gamePlayTime"
    case totalDistanceMoved = "totalDistanceMoved"
}
