//
//  View+Extension.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 03/08/23.
//

import SwiftUI

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
