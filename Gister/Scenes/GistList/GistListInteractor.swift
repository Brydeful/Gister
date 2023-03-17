//
//  GistListInteractor.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import Foundation

protocol GistListInteractorOutput {

}

protocol GistListInteractorInput {

    var output: GistListPresenterInput? { get set }

    func fetchGist() async throws -> [Gist]

}

final class GistListInteractor: GistListInteractorInput {

    let gistsFetchService: GistsFetchService

    var output: GistListPresenterInput?

    init(gistsFetchService: GistsFetchService) {
        self.gistsFetchService = gistsFetchService
    }

    func fetchGist() async throws -> [Gist] {
        try await gistsFetchService.fetchGists()
    }

}
