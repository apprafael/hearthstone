//
//  ContentView.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 30/07/23.
//

import SwiftUI

struct CardListView: View {
    @StateObject var viewModel: CardListViewModel
    var interactor: CardListBussinesLogic

    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    setupContent()
                }
                .listStyle(.plain)
                .background(setupGradientBackground())
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .background(AlertController(showAlert: $viewModel.showAlert,
                                    title: viewModel.showAlertTitle,
                                    message: viewModel.showAlertMessage,
                                             actions: [
                                                UIAlertAction(title: LocalizableStrings.cancel, style: .cancel)
                                             ]))
    }
    
    private func setupContent() -> some View {
        LazyVStack(alignment: .center) {
            ForEach(viewModel.cards.keys.sorted(), id: \.self) { cardKey in
                setupCategory(cardKey: cardKey)
            }
        }
        .onLoad {
            interactor.viewDidAppear()
        }
        .navigationDestination(for: Card.self) { card in
            CardDetailFactory(card: card).build()
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }

    private func setupCategory(cardKey: String) -> some View {
        LazyVStack {
            Text(cardKey)
                .font(.title)
                .padding(8)
                .foregroundColor(.white)
            setupCards(cardKey: cardKey)
        }
        .padding(.bottom, 84)
    }

    private func setupCards(cardKey: String) -> some View  {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.cards[cardKey] ?? [Card]()) { card in
                    NavigationLink(value: card) {
                        CardCellView(card: card)
                    }
                }
            }
        }
    }

    private func setupGradientBackground() -> some View {
        LinearGradient(
            colors: [.black,.white],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListFactoryMock().build()
    }
}
