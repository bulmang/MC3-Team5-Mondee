//
//  SampleModel.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/12.
//

import Foundation
import SwiftUI

// MARK: Data Manager

/// User 구조체 생성
struct User: Codable, Identifiable {
    var id = UUID()
//    var gameData: [String]
    var gameSuccess: Bool
    var gameFail: Bool
    var gamePlayTime: Int
    var gamePlayDate: Date
    var remainingHeartCount: Int
    var gameRetry: Bool
    
}

struct Live: Codable, Identifiable {
    var id = UUID()
    var gameStart: Bool
    var gamePause: Bool
    var remainHeartCount: Int
}

/// 클래스 생성
class UserData: ObservableObject {
    
    @Published var userdata: [User] = []

    /// 데이터 업로드
    init() {
        loadData()
    }

    /// 데이터 save
    func save(_ gameSuccess: Bool, _ gameFail: Bool, _ gamePlayTime: Int, _ gamePlayDate: Date, _ remainingHeartCount : Int, _ gameRetry : Bool) {
        let newData = User(gameSuccess: gameSuccess, gameFail: gameFail, gamePlayTime: gamePlayTime, gamePlayDate: gamePlayDate, remainingHeartCount: remainingHeartCount, gameRetry: gameRetry)
        userdata.append(newData)
        saveData()
    }
    
    /// 데이터 delete
    func delete(at index: Int) {
        userdata.remove(at: index)
        saveData()
    }

    /// 객체를 JSON 형식으로 인코딩하여 UserDefaults에 저장
    /// User 타입의 객체 배열을 저장하기 위함
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(userdata) {
            UserDefaults.standard.set(encodedData, forKey: "userData")
            loadData()
        }
    }
    
    /// UserDefaults에서 "userData"라는 키를 사용하여 데이터를 로드하고, 이를 JSON 디코딩하여 User 타입의 객체 배열로 디코딩
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "userData") {
            if let decodedData = try? JSONDecoder().decode([User].self, from: data) {
                userdata = decodedData
            }
        }
    }
}

class LiveData: ObservableObject {
    
    @Published var dataArray: [Live] = []

    /// 데이터 업로드
    init() {
        loadData()
    }

    /// 데이터 save
    func save(_ gameStart: Bool, _ gamePause: Bool, _ remainHeartCount: Int) {
        let newData = Live(gameStart: gameStart, gamePause: gamePause, remainHeartCount: remainHeartCount)
        dataArray.append(newData)
        saveData()
    }
    
    /// 데이터 delete
    func delete(at index: Int) {
        dataArray.remove(at: index)
        saveData()
    }

    /// 객체를 JSON 형식으로 인코딩하여 UserDefaults에 저장
    /// User 타입의 객체 배열을 저장하기 위함
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(dataArray) {
            UserDefaults.standard.set(encodedData, forKey: "liveData")
            loadData()
        }
    }
    
    /// UserDefaults에서 "userData"라는 키를 사용하여 데이터를 로드하고, 이를 JSON 디코딩하여 User 타입의 객체 배열로 디코딩
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: "liveData") {
            if let decodedData = try? JSONDecoder().decode([Live].self, from: data) {
                dataArray = decodedData
            }
        }
    }
}

