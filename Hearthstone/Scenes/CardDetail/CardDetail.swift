//
//  CardDetail.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 07/08/23.
//

import Foundation

struct CardDetail: Identifiable {
    var id: UUID { UUID() }
    
    let title: String
    let value: String
}
