//
//  HogeModelTest.swift
//  TestHogeFeature
//
//  Created by 佐藤汰一 on 2025/01/17.
//

import Testing
@testable import Core
@testable import HogeFeature

@Suite("HogeModelのテスト")
struct HogeModelTest {
    
    @Test(
        "メッセージに'a'が含まれない場合は有効と判断する",
        arguments: zip(
            [
               "Hello, World!",
               "a Hello, World!",
               "Hello, a World!",
               "A Hello, World!"
            ],
            [
                true,
                false,
                false,
                true
            ]
        )
    )
    func if_message_does_not_contain_a_it_is_considered_valid(
        inputMessage: String,
        expected: Bool
    ) async throws {
        
        let message = Message(text: inputMessage)
        let sut = HogeModel()
        
        let result = sut.isValidMessage(message: message)
        
        #expect(result == expected)
    }
}
