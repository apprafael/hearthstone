//
//  CardCell.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 01/08/23.
//

import SwiftUI

struct CardCellView: View {
    var card: Card
    
    var body: some View {
        VStack(alignment: .center) {
            setupImage()
            setupTitle()
        }
    }

    @ViewBuilder
    private func setupImage() -> some View {
        if let img = card.img {
            AsyncImage(url: URL(string: img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .shadow(color: .blue, radius: 10)
            } placeholder: {
                Rectangle()
                    .frame(width: 250, height: 400)
                    .foregroundColor(Color.gray.opacity(0.1))
            }
        }
    }

    @ViewBuilder
    private func setupTitle() -> some View {
        if let name = card.name {
            Text(name)
                .font(.title3)
                .foregroundColor(.white)
        }
    }
}

struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        if let card: Card = Card.fromJSON(fileName: "Card") {
            CardCellView(card: card)
        }
    }
}
