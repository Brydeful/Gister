//
//  Gist.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import Foundation

struct Gist: Decodable {

    let id: String
    let description: String?
    let url: URL
    let createDate: Date

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case createDate = "created_at"
        case description
    }

}
