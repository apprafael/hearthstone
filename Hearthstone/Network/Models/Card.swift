//
//  Card.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 01/08/23.
//

import Foundation

struct Card: Decodable, Identifiable, Hashable {
    var id: String { cardId }
    
    let cardId: String
    let dbfId: Int
    let name: String?
    let cardSet: String?
    let type: String?
    let text: String?
    let playerClass: String?
    let locale: String?
    let mechanics: [Mechanic]?
    let faction: String?
    let cost: Int?
    let attack: Int?
    let health: Int?
    let flavor: String?
    let artist: String?
    let elite: Bool?
    let spellSchool: String?
    let rarity: String?
    let race: String?
    let img: String?
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
