//
//  CardListInteractor.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 01/08/23.
//

import Foundation

protocol CardListBussinesLogic {
    func viewDidAppear()
}

final class CardListInteractor: CardListBussinesLogic {
    var worker: CardListWorkerProtocol
    var viewModel: CardListPresentationLogic

    init(worker: CardListWorkerProtocol, viewModel: CardListPresentationLogic) {
        self.worker = worker
        self.viewModel = viewModel
    }

    func viewDidAppear() {
        viewModel.isLoading(loading: true)
        worker.getCards { [weak self] result in
            guard let self else { return }
            
            viewModel.isLoading(loading: false)
            
            switch result {
            case .success(let cards):
                let filteredDictionary = cards.compactMapValues { cards in
                    let nonNilImgCards = cards.filter { $0.img != nil }
                    return nonNilImgCards.isEmpty ? nil : nonNilImgCards
                }
                
                viewModel.displayCards(cards: filteredDictionary)
            case .failure(let error):
                viewModel.displayError(error: error.localizedDescription)
            }
        }
    }
}
