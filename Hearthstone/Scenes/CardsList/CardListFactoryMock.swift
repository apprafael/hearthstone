//
//  CardListFactoryMock.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 03/08/23.
//

import SwiftUI

final class CardListFactoryMock {
    
    func build() -> some View {
        let viewModel = CardListViewModel()
        let worker = CardListWorkerMock()
        let interactor = CardListInteractor(worker: worker, viewModel: viewModel)
        return CardListView(viewModel: viewModel, interactor: interactor)
    }
}
