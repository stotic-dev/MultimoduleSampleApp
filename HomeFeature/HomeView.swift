//
//  HomeView.swift
//  HomeFeature
//
//  Created by 佐藤汰一 on 2025/01/15.
//

import Core
import SwiftUI

public struct HomeView: View {
    
    private let message: Message
        
    public init(message: Message) {
        
        self.message = message
    }
    
    public var body: some View {
        Text(message.text)
    }
}

#Preview {
    HomeView(message: .init(text: "Hello World!"))
}
