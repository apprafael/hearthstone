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
                AsyncImage(url: url) { image in
                    image
                        .shadow(color: .blue, radius: 10)
                        .offset(y: isFloatingUp ? -10 : 10)
                } placeholder: {
                    Rectangle()
                        .frame(width: 350, height: 600)
                        .foregroundColor(Color.gray.opacity(0.1))
                }
            } else {
                Rectangle()
                    .frame(width: 350, height: 600)
                    .foregroundColor(Color.gray.opacity(0.1))
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                isFloatingUp.toggle()
            }
        }
    }
}

