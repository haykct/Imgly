//
//  ListModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Foundation

/// A model that decodes data from the network for the ListView.
struct ListModel: Decodable, Hashable {
    let id: String?
    let label: String?
    // It's better to keep 'children' as a non-nil property(It can be empty).
    // Otherwise it will conflict with @Binding property wrapper in the ItemsList.
    var children: [ListModel]
    // Since id property can be nil, it's necessary to add listID for icentification in swiftUI List.
    let listID = UUID()

    private enum CodingKeys: CodingKey {
        case id, label, children
    }

    // Implemented init manually to avoid decoding of listID and get default value for children property.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.children = try container.decodeIfPresent([ListModel].self, forKey: .children) ?? []
    }
}
