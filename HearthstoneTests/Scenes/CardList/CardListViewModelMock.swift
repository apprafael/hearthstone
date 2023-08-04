//
//  CardListViewModelMock.swift
//  HearthstoneTests
//
//  Created by Rafael Almeida on 04/08/23.
//

import Foundation

@testable import Hearthstone

class  CardListViewModelMock: CardListPresentationLogic {
    var isLoadingCalled = false
    var displayCardsCalled = false
    var displayErrorCalled = false

    func isLoading(loading: Bool) {
        isLoadingCalled = true
    }

    func displayCards(cards: [String: [Card]]) {
        displayCardsCalled = true
    }

    func displayError(error: String) {
        displayErrorCalled = true
    }
}
