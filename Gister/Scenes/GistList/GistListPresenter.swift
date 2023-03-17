//
//  GistListPresenter.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import Foundation

protocol GistListPresenterInput: AnyObject {

}

protocol GistListPresenterOutput: AnyObject {

}

final class GistListPresenter {

    weak var output: GistListPresenterOutput?
    private let interactor: GistListInteractorInput
    private let router: GistListRouterInput
    private let view: GistListViewControllerInput

    init(interactor: GistListInteractorInput, router: GistListRouterInput, view: GistListViewControllerInput) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

}

// MARK: - GistListViewControllerOutput

extension GistListPresenter: GistListViewControllerOutput {

    func viewDidLoad() {
        Task {
            do {
                let gists = try await interactor.fetchGist()
                print(gists)
            } catch {
                print(error)
            }

        }
    }

}

// MARK: - GistListInteractorOutput

extension GistListPresenter: GistListInteractorOutput {

}

// MARK: - GistListPresenterInput

extension GistListPresenter: GistListPresenterInput {

}
