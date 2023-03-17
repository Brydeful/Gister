//
//  NetworkService.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import Foundation

protocol NetworkService {

    func load<T: Decodable>(url: URL) async throws -> [T]

}

final class NetworkServiceImplementation: NetworkService {

    func load<T>(url: URL) async throws -> [T] where T: Decodable {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([T].self, from: data)
    }

}
