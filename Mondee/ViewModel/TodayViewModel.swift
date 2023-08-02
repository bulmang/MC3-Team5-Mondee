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
    @Published var gameStatus: GameStatus = .noStatus
    
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
        let successfulUserDates = Set(users.filter { $0.gameSuccess }.map { $0.gamePlayDate })
        successCount = successfulUserDates.count
        updateGameStatus(from: users)
    }
    
    private func updateGameStatus(from users: [User]) {
        let hasSuccessToday = users.contains { user in
            isDateToday(user.gamePlayDate) && user.gameSuccess
        }
        let hasFailToday = users.contains { user in
            isDateToday(user.gamePlayDate) && user.gameFail
        }
        
        if hasSuccessToday {
            let hasMondeeForToday = PhoneDataModel.shared.mondeeLogData.mondeeLog.contains { mondeeLog in
                isDateToday(mondeeLog.date)
            }
            if hasSuccessToday && !hasMondeeForToday {
                newMondee = true
            } else {
                newMondee = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.gameStatus = .finishedSuccess
            }
        } else if hasFailToday {
            gameStatus = .finishedFail
        } else {
            let hasInProgressGame = users.contains { user in
                isDateToday(user.gamePlayDate) && user.gameStart && !user.gameSuccess && !user.gameFail
            }
            
            gameStatus = hasInProgressGame ? .inProgress : .notStarted
        }
        
        
    }
    
    private func handleMondeeLogUpdate(_ mondeeLogList: [MondeeLog]) {
        todayMondee = mondeeLogList.first(where: { isDateToday($0.date) })?.mondee
    }
    
    var currentLevel: Level {
        for level in levelList {
            if successCount >= level.startNumber && successCount <= level.endNumber {
                return level
            }
        }
        return levelList.last!
    }
}

// Utility function
func isDateToday(_ date: Date) -> Bool {
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    let currentDateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
    
    return dateComponents == currentDateComponents
}
