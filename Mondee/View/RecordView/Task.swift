//
//  Task.swift
//  Mondee
//
//  Created by seunghoria on 2023/07/24.
//

import SwiftUI

// Task Model and Sample Tasks...
// Array of Tasks...

struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}
