//
//  TabModel.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "투데이", icon: "house", tab: .today),
    TabItem(text: "기록", icon: "note.text", tab: .record),
    TabItem(text: "멸균실", icon: "bubbles.and.sparkles", tab: .cleanRoom)
]

enum Tab: String {
    case today
    case record
    case cleanRoom
}
