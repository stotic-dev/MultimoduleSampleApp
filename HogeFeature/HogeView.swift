//
//  HogeView.swift
//  HomeFeature
//
//  Created by 佐藤汰一 on 2025/01/15.
//

import Core
import SwiftUI

public struct HogeView: View {
    
    @State private var viewModel: HogeViewModel
    
    public init(message: Message, storage: UserDefaults = .standard) {
        
        viewModel = .init(viewState: .init(), message: message, storage: storage)
    }
    
    public var body: some View {
        ZStack {
            Text(viewModel.viewState.accountName)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.all, 8)
            VStack {
                if viewModel.viewState.isHiding {
                    Text("Hiding Message...")
                }
                else {
                    Text(viewModel.text)
                }
                Spacer()
                    .frame(height: 50)
                Button("Tap") {
                    viewModel.tappedButton()
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    var previewStorage: UserDefaults {
        let storage = UserDefaults(suiteName: "Preview_HogeView")!
        storage.set("stotic-dev", forKey: "AccountName")
        return storage
    }
    HogeView(message: .init(text: "Hello World!"),
             storage: previewStorage)
}
