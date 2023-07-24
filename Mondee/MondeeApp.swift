//
//  MondeeApp.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/11.
//

import SwiftUI

@main
struct MondeeApp: App {
    @State var date = Date()
    
    var body: some Scene {
        WindowGroup {
            RecordCalendarView(currentDate: $date)
        }
    }
}

