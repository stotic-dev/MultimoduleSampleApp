//
//  HogeViewModel.swift
//  MultimoduleSample
//
//  Created by 佐藤汰一 on 2025/01/17.
//

import Core
import SwiftUI

@Observable
public final class HogeViewModel {
    
    var text: String { message.text }
    private let message: Message
    private(set) var viewState: ViewState
    
    private let hogeModel = HogeModel()
    private let storage: UserDefaults
    
    init(viewState: HogeViewModel.ViewState,
         message: Message,
         storage: UserDefaults) {
        
        self.viewState = viewState
        self.message = message
        self.storage = storage
    }
    
    func onAppear() {
        
        viewState.accountName = storage.value(forKey: "AccountName") as? String ?? ""
        viewState.isHiding = !hogeModel.isValidMessage(message: message)
    }
    
    func tappedButton() {
        
        if !hogeModel.isValidMessage(message: message) { return }
        viewState.isHiding.toggle()
    }
}

extension HogeViewModel {
    
    struct ViewState {
        
        var isHiding = true
        var accountName = ""
    }
}
