//
//  DateViewModel.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/24.
//

import Foundation
import SwiftUI

//MARK: 날짜 기본 틀
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day : Int
    var date : Date
    var key:String{
        let nowDate = self.date // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd" // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
}

//MARK: Date Struct
struct DateMetaData: Identifiable{
    var id = UUID().uuidString
    var date: Date
}

struct DateVM{
    //MARK: 날짜 가져오기 함수
    func getSimpleDate(offset: Int)->Date{
        let calendar = Calendar.current
        
        let date = calendar.date(byAdding: .day, value: offset, to: Date())
        
        return date ?? Date()
    }
}
