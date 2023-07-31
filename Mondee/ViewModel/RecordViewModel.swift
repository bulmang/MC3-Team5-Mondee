//
//  RecordViewModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/28.
//

import SwiftUI

// MARK: 성공 횟수, 실패 횟수, 플레이 타임을 계산하는 UserData extension

extension UserData {
    /// - Returns: gameSuccess가 true인 원소 수
    func countGameSuccess() -> Int {
        return userdata.reduce(0) { count, user in
            return count + (user.gameSuccess ? 1 : 0)
        }
    }

    /// - Returns: gameFail이 true인 원소 수
    func countGameFail() -> Int {
        return userdata.reduce(0) { count, user in
            return count + (user.gameFail ? 1 : 0)
        }
    }
    
    /// monthOffset을 받아 해당 월의 성공횟수를 구해주는 함수
    /// monthOffset의 경우 RecordCalendarView에서 사용하는 currentMonth를 사용하였습니다.
    /// currentMonth의 경우 이번달은 0, 한달전은 -1, 한달후는 +1, 두달전은 -2 식으로 주어지는 변수입니다.
    /// - Parameter monthOffset: currentMonth 값을 받아옵니다.
    /// - Returns: 해당 월의 성공횟수
    func countGameSuccess(inMonth monthOffset: Int) -> Int {
        let currentDate = Date()
        let targetDate = Calendar.current.date(byAdding: .month, value: monthOffset, to: currentDate) ?? currentDate
        
        let successCount = userdata.reduce(0) { count, user in
            let calendar = Calendar.current
            let isTargetMonth = calendar.isDate(user.gamePlayDate, equalTo: targetDate, toGranularity: .month)
            return count + (user.gameSuccess && isTargetMonth ? 1 : 0)
        }
        
        return successCount
    }

    /// monthOffset을 받아 해당 월의 실패횟수를 구해주는 함수
    /// monthOffset의 경우 RecordCalendarView에서 사용하는 currentMonth를 사용하였습니다.
    /// currentMonth의 경우 이번달은 0, 한달전은 -1, 한달후는 +1, 두달전은 -2 식으로 주어지는 변수입니다.
    /// - Parameter monthOffset: currentMonth 값을 받아옵니다.
    /// - Returns: 해당 월의 실패횟수
    func countGameFail(inMonth monthOffset: Int) -> Int {
        let currentDate = Date()
        let targetDate = Calendar.current.date(byAdding: .month, value: monthOffset, to: currentDate) ?? currentDate
        
        let failCount = userdata.reduce(0) { count, user in
            let calendar = Calendar.current
            let isTargetMonth = calendar.isDate(user.gamePlayDate, equalTo: targetDate, toGranularity: .month)
            return count + (user.gameFail && isTargetMonth ? 1 : 0)
        }
        
        return failCount
    }
    
    /// monthOffset을 받아 해당 월의 플레이 시간을 구해주는 함수
    /// monthOffset의 경우 RecordCalendarView에서 사용하는 currentMonth를 사용하였습니다.
    /// currentMonth의 경우 이번달은 0, 한달전은 -1, 한달후는 +1, 두달전은 -2 식으로 주어지는 변수입니다.
    /// - Parameter monthOffset: currentMonth 값을 받아옵니다.
    /// - Returns: 해당 월의 플레이 시간
    func totalGamePlayTime(inMonth monthOffset: Int) -> Int {
        let currentDate = Date()
        let targetDate = Calendar.current.date(byAdding: .month, value: monthOffset, to: currentDate) ?? currentDate
        
        let totalPlayTime = userdata.reduce(0) { totalPlayTime, user in
            let calendar = Calendar.current
            let isTargetMonth = calendar.isDate(user.gamePlayDate, equalTo: targetDate, toGranularity: .month)
            return totalPlayTime + (isTargetMonth ? user.gamePlayTime : 0)
        }
        
        return totalPlayTime
    }
    
    /// 총 플레이 타임을 가져오는 함수입니다.
    /// - Returns: 총 플레이 타임
    func totalGamePlayTime() -> Int {
        return userdata.reduce(0) { totalPlayTime, user in
            return totalPlayTime + user.gamePlayTime
        }
    }

    /// 게임 성공 날짜가 있는지 판별하는 함수
    /// - Parameter date: 판별할 날짜
    /// - Returns: 게임 성공 여부에 따라 true, false 값을 반환합니다.
    func isSuccessfulDate(date: Date) -> Bool {
        let successfulDates = userdata.filter { $0.gameSuccess }.map { $0.gamePlayDate }
        return successfulDates.contains { successfulDate in
            Calendar.current.isDate(successfulDate, inSameDayAs: date)
        }
    }
    
    
    //MARK: 사용하지 않는 함수
    
    /// 이번달의 실패 횟수를 가져오는 함수입니다.
    /// 뷰에서는 사용하지 않지만 혹시나 해서 일단 남겨두었습니다.
    /// - Returns: 이번달의 실패 횟수
    func countGameFailThisMonth() -> Int {
        let currentDate = Date()
        return userdata.reduce(0) { count, user in
            let calendar = Calendar.current
            let isThisMonth = calendar.isDate(user.gamePlayDate, equalTo: currentDate, toGranularity: .month)
            return count + (user.gameFail && isThisMonth ? 1 : 0)
        }
    }
    
    /// 이번달의 성공 횟수를 가져오는 함수입니다.
    /// 뷰에서는 사용하지 않지만 혹시나 해서 일단 남겨두었습니다.
    /// - Returns: 이번달의 성공 횟수
    func countGameSuccessThisMonth() -> Int {
        let currentDate = Date()
        return userdata.reduce(0) { count, user in
            let calendar = Calendar.current
            let isThisMonth = calendar.isDate(user.gamePlayDate, equalTo: currentDate, toGranularity: .month)
            return count + (user.gameSuccess && isThisMonth ? 1 : 0)
        }
    }

    /// 이번 달의 총 플레이 타임을 가져오는 함수.
    /// 뷰에서는 사용하지 않지만 혹시나 해서 일단 남겨두었습니다.
    /// - Returns: 이번 달의 총 플레이 타임
    func gamePlayTimeThisMonth() -> Int {
        let currentDate = Date()
        return userdata.reduce(0) { totalPlayTime, user in
            let calendar = Calendar.current
            let isThisMonth = calendar.isDate(user.gamePlayDate, equalTo: currentDate, toGranularity: .month)
            return totalPlayTime + (isThisMonth ? user.gamePlayTime : 0)
        }
    }
}


//MARK: 연속 성공 횟수를 가져오는 함수

extension UserData {
    private var maxConsecutiveSuccessCountKey: String { "maxConsecutiveSuccessCount" }
    
    // UserDefaults를 사용하여 최대 연속 성공횟수를 저장
    private var maxConsecutiveSuccessCount: Int {
        get { UserDefaults.standard.integer(forKey: maxConsecutiveSuccessCountKey) }
        set { UserDefaults.standard.set(newValue, forKey: maxConsecutiveSuccessCountKey) }
    }
    
    /// 최근 연속 성공횟수와 최대 연속 성공횟수를 반환하는 함수
    /// - Returns: (최근 연속 성공횟수, 최대 연속 성공횟수)
    func consecutiveSuccessCounts() -> (recent: Int, max: Int) {
        var consecutiveCount = 0
        var maxConsecutiveCount = maxConsecutiveSuccessCount
        
        for user in userdata {
            if user.gameSuccess {
                consecutiveCount += 1
                maxConsecutiveCount = max(maxConsecutiveCount, consecutiveCount)
            } else {
                /// 배열을 돌려 연속되지 않으면 0으로 초기화 합니다
                consecutiveCount = 0
            }
        }
        
        // 최대 연속 성공횟수를 UserDefaults에 저장합니다.
        maxConsecutiveSuccessCount = maxConsecutiveCount
        
        return (recent: consecutiveCount, max: maxConsecutiveCount)
    }
}

