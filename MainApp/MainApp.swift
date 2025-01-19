//
//  MainApp.swift
//  MainApp
//
//  Created by 佐藤汰一 on 2025/01/15.
//

import Core
import HogeFeature
import SwiftUI

@main
struct MainApp: App {
        
    var body: some Scene {
        WindowGroup {
            HogeView(message: Message(text: "Start App!"))
        }
    }
}
