//
//  HogeModel.swift
//  MultimoduleSample
//
//  Created by 佐藤汰一 on 2025/01/17.
//

import Core

struct HogeModel {
    
    func isValidMessage(message: Message) -> Bool {
        
        return !message.text.contains("a")
    }
}
