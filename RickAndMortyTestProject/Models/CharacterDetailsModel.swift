//
//  CharacterDetailsModel.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 05.04.2021.
//

import UIKit

struct Details: Codable {
    let name, status, species: String
    let gender: String
    let origin, location: DetailsLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String

    func fieldsToDisplay() -> [[String: Any]] {
        return [
            ["name:": name],
            ["status:": status],
            ["species:": species],
            ["gender:": gender],
            ["location:": "\(location.name)\r\n\(location.url)"],
            ["image:": image],
            ["episode:": episode.joined(separator: "\r\n")],
            ["url:": url],
            ["created:": created],
        ]
    }
}

struct DetailsLocation: Codable {
    let name: String
    let url: String
}
