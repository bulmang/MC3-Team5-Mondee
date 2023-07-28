//
//  RecordViewModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/28.
//

import SwiftUI

// MARK: - Extension for Counting Game Success and Game Fail
extension UserData {
    /// gameSuccess가 true인 원소 수를 가져옴
    func countGameSuccess() -> Int {
        return userdata.reduce(0) { count, user in
            return count + (user.gameSuccess ? 1 : 0)
        }
    }

    /// gameFail이 true인 원소 수를 가져옴
    func countGameFail() -> Int {
        return userdata.reduce(0) { count, user in
            return count + (user.gameFail ? 1 : 0)
        }
    }

    /// 이번 달의 게임 성공 횟수를 가져옴
    func countGameSuccessThisMonth() -> Int {
        let currentDate = Date()
        return userdata.reduce(0) { count, user in
            let calendar = Calendar.current
            let isThisMonth = calendar.isDate(user.gamePlayDate, equalTo: currentDate, toGranularity: .month)
            return count + (user.gameSuccess && isThisMonth ? 1 : 0)
        }
    }

    /// 이번 달의 게임 실패 횟수를 가져옴
    func countGameFailThisMonth() -> Int {
        let currentDate = Date()
        return userdata.reduce(0) { count, user in
            let calendar = Calendar.current
            let isThisMonth = calendar.isDate(user.gamePlayDate, equalTo: currentDate, toGranularity: .month)
            return count + (user.gameFail && isThisMonth ? 1 : 0)
        }
    }

    /// 총 플레이 타임을 가져옴
    func totalGamePlayTime() -> Int {
        return userdata.reduce(0) { totalPlayTime, user in
            return totalPlayTime + user.gamePlayTime
        }
    }

    /// 이번 달의 총 플레이 타임을 가져옴
    func gamePlayTimeThisMonth() -> Int {
        let currentDate = Date()
        return userdata.reduce(0) { totalPlayTime, user in
            let calendar = Calendar.current
            let isThisMonth = calendar.isDate(user.gamePlayDate, equalTo: currentDate, toGranularity: .month)
            return totalPlayTime + (isThisMonth ? user.gamePlayTime : 0)
        }
    }
    
    /// 게임 성공 날짜가 있는지 판별하는 함수
    func isSuccessfulDate(date: Date) -> Bool {
        let successfulDates = userdata.filter { $0.gameSuccess }.map { $0.gamePlayDate }
        return successfulDates.contains { successfulDate in
            Calendar.current.isDate(successfulDate, inSameDayAs: date)
        }
    }
}

