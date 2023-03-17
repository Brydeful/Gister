//
//  GistsFetchService.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import Foundation

protocol GistsFetchService {

    func fetchGists() async throws -> [Gist]

}

final class GistsFetchServiceImplementation: GistsFetchService {

    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkServiceImplementation()) {
        self.networkService = networkService
    }

    func fetchGists() async throws -> [Gist] {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Constants.host
        urlComponents.path = Constants.gistsEndpoint
        guard let url = urlComponents.url else { throw GistsFetchServiceError.noValidURL }
        let gists: [Gist] = try await networkService.load(url: url)
        return gists
    }

    private enum Constants {
        static let scheme = "https"
        static let host = "api.github.com"
        static let gistsEndpoint = "/gists/public"
    }

    enum GistsFetchServiceError: Error {
        case noValidURL
    }
}
