//
//  CleanRoomModel.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/26.
//

import Foundation

struct CollectedMondee: Identifiable {
    var id = UUID()
    var index : Int
    var collectedMondeeName: String
    var collectedMondeeDate: Date
    var collectedMondeeDescription: String
    var collectedMondeeImg: String
    var isCollected: Bool
}
