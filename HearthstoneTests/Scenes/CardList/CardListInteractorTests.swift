//
//  HearthstoneTests.swift
//  HearthstoneTests
//
//  Created by Rafael Almeida on 04/08/23.
//

import XCTest

@testable import Hearthstone

class CardListInteractorTests: XCTestCase {

    var worker: CardListWorkerProtocol!
    var viewModel: CardListViewModelMock!
    var interactor: CardListInteractor!

    override func setUp() {
        super.setUp()
        
        worker = CardListWorkerMock()
        viewModel = CardListViewModelMock()
        interactor = CardListInteractor(worker: worker, viewModel: viewModel)
    }

    override func tearDown() {
        worker = nil
        viewModel = nil
        interactor = nil
        
        super.tearDown()
    }

    func testViewDidAppear() {
        // When
        interactor.viewDidAppear()
        
        // Verify isLoading was called
        XCTAssertTrue(viewModel.isLoadingCalled, "isLoading was not called")
        
        // Verify the methods were called
        XCTAssertTrue(viewModel.displayCardsCalled, "displayCards was not called")
        XCTAssertFalse(viewModel.displayErrorCalled, "displayError should not have been called")
    }
}
