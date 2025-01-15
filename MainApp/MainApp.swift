//
//  MainApp.swift
//  MainApp
//
//  Created by 佐藤汰一 on 2025/01/15.
//

import Core
import HomeFeature
import SwiftUI

@main
struct MainApp: App {
        
    var body: some Scene {
        WindowGroup {
            HomeView(message: Message(text: "Start App!"))
        }
    }
}
