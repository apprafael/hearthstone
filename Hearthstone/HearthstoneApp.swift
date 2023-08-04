//
//  HearthstoneApp.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 30/07/23.
//

import SwiftUI

@main
struct HearthstoneApp: App {
    var body: some Scene {
        WindowGroup {
            CardListFactory().build()
        }
    }
}
