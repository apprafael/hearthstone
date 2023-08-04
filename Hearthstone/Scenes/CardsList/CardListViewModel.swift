//
//  CardsListViewModel.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 01/08/23.
//

import Foundation

protocol CardListPresentationLogic {
    func displayCards(cards: [String: [Card]])
    func displayError(error: String)
    func isLoading(loading: Bool)
}

final class CardListViewModel: ObservableObject {
    @Published var cards: [String: [Card]] = [String: [Card]]()
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var showAlertTitle: String = String()
    @Published var showAlertMessage: String = String()
    
}

extension CardListViewModel: CardListPresentationLogic {
    func displayCards(cards: [String: [Card]]) {
        DispatchQueue.main.async {
            self.cards = cards
        }
    }
    
    func displayError(error: String) {
        showAlert = true
        showAlertMessage = error
    }

    func isLoading(loading: Bool) {
        isLoading = loading
    }
}
