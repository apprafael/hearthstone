//
//  CardDetail.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 02/08/23.
//

import SwiftUI

struct CardDetailView: View {
    @StateObject var viewModel: CardDetailViewModel
    var interactor: CardDetailBussinesLogic
    @State private var isFloatingUp = false

    var body: some View {
        List {
            setupContent()
                .padding()
        }
        .listStyle(.plain)
        .background(setupGradientBackGround())
        .onAppear {
            interactor.viewDidAppear()
        }
    }

    private func setupContent() -> some View {
        VStack(alignment: .leading) {
            Spacer()
            setupCardImage()
            setupDetailsList()
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }

    @ViewBuilder
    private func setupCardImage() -> some View {
        if let imageURL = viewModel.card?.img, let url = URL(string: imageURL) {
            FloatingImageView(url: url)
        }
    }


    private func setupDetailsList() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(viewModel.cardDetails) { detail in
                setupDetailsRow(title: detail.title, text: detail.value)
            }
        }
    }

    private func setupDetailsRow(title: String, text: String) -> some View {
        HStack(alignment: .top) {
            Text("\(title):")
            Text(text)
                .font(.headline)
        }
    }


    private func setupGradientBackGround() -> some View {
        LinearGradient(colors: [.gray, .white],
                       startPoint: .top,
                       endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        if let card: Card = Card.fromJSON(fileName: "Card") {
            CardDetailFactory(card: card).build()
        }
    }
}
