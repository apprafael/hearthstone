//
//  CardListWorkerMock.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 03/08/23.
//

import Foundation

final class CardListWorkerMock: CardListWorkerProtocol {
    func getCards(completion: @escaping (Result<[String: [Card]], Error>) -> Void) {
        if let cardCollection: [String: [Card]] = Card.fromJSON(fileName: "Cards") {
            return completion(.success(cardCollection))
        }
    }
}
