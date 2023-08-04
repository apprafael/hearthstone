//
//  FloatingImageView.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 04/08/23.
//

import SwiftUI

struct FloatingImageView: View {
    let url: URL?
    @State private var isFloatingUp = false

    var body: some View {
        Group {
            if let url = url {
                AsyncImage(url: url)
                    .shadow(color: .blue, radius: 10)
                    .offset(y: isFloatingUp ? -10 : 10)
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                isFloatingUp.toggle()
            }
        }
    }
}

