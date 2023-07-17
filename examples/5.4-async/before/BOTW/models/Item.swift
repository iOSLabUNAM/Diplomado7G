//
//  Item.swift
//  BOTW
//
//  Created by Luis Ezcurdia on 15/07/23.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let category: String
    let imageUrlString: String
    let commonLocations: [String]
    let drops: [String]
    let dlc: Bool
    let edible: Bool
    
    var imageUrl: URL? {
        get { return URL(string: self.imageUrlString) }
    }

    enum CodingKeys: String, CodingKey {
        case id, name, description, category
        case imageUrlString = "image"
        case commonLocations = "common_locations"
        case drops, dlc, edible
    }
}
