//
//  LoadingView.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 04/08/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
            .scaleEffect(2)
    }
}
