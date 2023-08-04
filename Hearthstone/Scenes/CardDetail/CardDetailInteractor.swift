//
//  CardDetailInteractor.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 03/08/23.
//

import Foundation

protocol CardDetailBussinesLogic {
    func viewDidAppear()
}

final class CardDetailInteractor {
    private var card: Card
    private var viewModel: CardDetailPresentationLogic

    init(viewModel: CardDetailPresentationLogic, card: Card) {
        self.viewModel = viewModel
        self.card = card
    }
}

extension CardDetailInteractor: CardDetailBussinesLogic {
    func viewDidAppear() {
        viewModel.displayCardDetail(card: card)
    }
}
