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
        if let cardSet = card?.cardSet { details.append(CardDetail(title: LocalizableStrings.set, value: cardSet)) }
        if let type = card?.type { details.append(CardDetail(title: LocalizableStrings.type, value: type)) }
        if let faction = card?.faction { details.append(CardDetail(title: LocalizableStrings.faction, value: faction)) }
        if let rarity = card?.rarity { details.append(CardDetail(title: LocalizableStrings.rarity, value: rarity)) }
        if let attack = card?.attack { details.append(CardDetail(title: LocalizableStrings.attack, value: String(attack))) }
        if let cost = card?.cost { details.append(CardDetail(title: LocalizableStrings.cost, value: String(cost))) }
        if let health = card?.health { details.append(CardDetail(title: LocalizableStrings.health, value: String(health))) }
        
        self.cardDetails = details
    }
}

extension CardDetailViewModel: CardDetailPresentationLogic {
    func displayCardDetail(card: Card) {
        self.card = card
    }
}
