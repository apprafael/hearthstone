//
//  CardListFactory.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 03/08/23.
//

import SwiftUI

final class CardDetailFactory {
    private var card: Card
    
    init(card: Card) {
        self.card = card
    }

    func build() -> some View {
        let viewModel = CardDetailViewModel()
        let interactor = CardDetailInteractor(viewModel: viewModel, card: card)
        return CardDetailView(viewModel: viewModel, interactor: interactor)
    }
}
