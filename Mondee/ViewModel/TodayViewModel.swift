//
//  TodayViewModel.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/25.
//

import SwiftUI
import Combine

class TodayViewModel: ObservableObject {
    @Published var successCount: Int = 0
    @Published var todayMondee: Mondee?
    @Published var newMondee: Bool = false
    @Published var gameStatus: GameStatus = .noStatus {
        didSet {
            if oldValue == .notStarted && gameStatus == .finishedSuccess {
                newMondee = true
            }
        }
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupSubscriptions()
    }
    
    func saveTodayMondee(mondee: Mondee) {
        let today = Date()
        PhoneDataModel.shared.mondeeLogData.save(mondee, today)
    }
    
    private func setupSubscriptions() {
        PhoneDataModel.shared.userData.$userdata
            .sink { [weak self] users in
                self?.handleUserArrayUpdate(users)
            }
            .store(in: &cancellables)
        
        PhoneDataModel.shared.mondeeLogData.$mondeeLog
            .sink { [weak self] mondeeLogList in
                self?.handleMondeeLogUpdate(mondeeLogList)
            }
            .store(in: &cancellables)
    }
    
    private func handleUserArrayUpdate(_ users: [User]) {
        successCount = users.filter { $0.gameSuccess == true }.count
        
        let hasSuccessToday = users.contains { user in
            isDateToday(user.gamePlayDate) && user.gameSuccess
        }
        
        if hasSuccessToday {
            gameStatus = .finishedSuccess
        } else {
            gameStatus = .notStarted
        }
    }
    
    private func handleMondeeLogUpdate(_ mondeeLogList: [MondeeLog]) {
        if let todayMondeeLog = mondeeLogList.first(where: { isDateToday($0.date) }) {
            todayMondee = todayMondeeLog.mondee
        } else {
            todayMondee = nil
        }
    }
    
    var currentLevel: Level {
        for level in levelList {
            if successCount >= level.startNumber && successCount <= level.endNumber {
                return level
            }
        }
        return levelList.last!
    }
    
    private let levelList = [
        Level(name: "청응애", startNumber: 0, endNumber: 3, mondeeImg: "ImgMondeeLevel1-IOS", nextLevelMessage: "청린이가 되기까기"),
        Level(name: "청린이", startNumber: 4, endNumber: 7, mondeeImg: "ImgMondeeLevel2-IOS", nextLevelMessage: "청년이 되기까기"),
        Level(name: "청년", startNumber: 8, endNumber: 11, mondeeImg: "ImgMondeeLevel3-IOS", nextLevelMessage: "청른이가 되기까기"),
        Level(name: "청른이", startNumber: 12, endNumber: 15, mondeeImg: "ImgMondeeLevel4-IOS", nextLevelMessage: "청고수가 되기까기"),
        Level(name: "청고수", startNumber: 16, endNumber: 16, mondeeImg: "ImgMondeeLevel5-IOS", nextLevelMessage: "이게 바로 고수의 삶")
    ]
}

// Utility function
func isDateToday(_ date: Date) -> Bool {
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    let currentDateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
    
    return dateComponents == currentDateComponents
}
