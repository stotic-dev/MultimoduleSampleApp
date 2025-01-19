//
//  HogeViewModelTest.swift
//  TestHogeFeature
//
//  Created by 佐藤汰一 on 2025/01/18.
//

import XCTest
@testable import Core
@testable import HogeFeature

final class HogeViewModelTest: XCTestCase {
    
    // 正常系

    func test_acquire_account_name_and_verify_message_when_appear() throws {
        
        let message = Message(text: "aaa")
        let testStorage = UserDefaults(suiteName: #function)!
        testStorage.set("test name", forKey: "AccountName")
        let sut = HogeViewModel(viewState: .init(), message: message, storage: testStorage)
        
        sut.onAppear()
        
        XCTAssertEqual(sut.viewState.accountName, "test name")
        XCTAssertTrue(sut.viewState.isHiding)
    }
    
    func test_holding_invalid_message_remains_hidden_when_tapped_button() throws {
        
        let message = Message(text: "aaa")
        let testStorage = UserDefaults(suiteName: #function)!
        let sut = HogeViewModel(viewState: .init(isHiding: true),
                                message: message,
                                storage: testStorage)
        
        sut.tappedButton()
        
        XCTAssertTrue(sut.viewState.isHiding)
    }
    
    func test_holding_valid_message_displayed_when_tapped_button() throws {
        
        let message = Message(text: "bbb")
        let testStorage = UserDefaults(suiteName: #function)!
        let sut = HogeViewModel(viewState: .init(isHiding: true),
                                message: message,
                                storage: testStorage)
        
        sut.tappedButton()
        
        XCTAssertFalse(sut.viewState.isHiding)
    }
    
    // 異常系
    
    func test_show_account_name_empty_when_storage_accountName_is_empty() throws {
        
        let message = Message(text: "aaa")
        let testStorage = UserDefaults(suiteName: #function)!
        let sut = HogeViewModel(viewState: .init(), message: message, storage: testStorage)
        
        sut.onAppear()
        
        XCTAssertEqual(sut.viewState.accountName, "")
        XCTAssertTrue(sut.viewState.isHiding)
    }
}
