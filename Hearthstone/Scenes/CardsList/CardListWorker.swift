//
//  CardListWorker.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 01/08/23.
//

import Foundation

protocol CardListWorkerProtocol {
    func getCards(completion: @escaping (Result<[String: [Card]], Error>) -> Void)
}

final class CardListWorker: CardListWorkerProtocol {
    let service = NetworkServiceImpl<HearthStoneAPI>()

    func getCards(completion: @escaping (Result<[String: [Card]], Error>) -> Void) {
        service.request(.getCards) { result in
            completion(result)
        }
    }
}
