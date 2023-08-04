//
//  CardDetailViewModel.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 03/08/23.
//

import Foundation

protocol CardDetailPresentationLogic {
    func displayCardDetail(card: Card)
}

final class CardDetailViewModel: ObservableObject {
    @Published var cardDetails: [CardDetail] = [CardDetail]()
    @Published var card: Card? {
        didSet {
            updateCardDetail()
        }
    }
    
    private func updateCardDetail() {
        var details: [CardDetail] = []
        if let name = card?.name { details.append(CardDetail(title: LocalizableStrings.name, value: name)) }
        if let flavor = card?.flavor { details.append(CardDetail(title: LocalizableStrings.flavor, value: flavor)) }
        if let description = card?.text?.stringReadingHtml { details.append(CardDetail(title: LocalizableStrings.description, value: description)) }
        // Add more properties here
        if let health = card?.health { details.append(CardDetail(title: LocalizableStrings.health, value: String(health))) }
        self.cardDetails = details
    }
}

extension CardDetailViewModel: CardDetailPresentationLogic {
    func displayCardDetail(card: Card) {
        self.card = card
    }
}

struct CardDetail: Identifiable {
    var id: UUID { UUID() }
    
    let title: String
    let value: String
}
