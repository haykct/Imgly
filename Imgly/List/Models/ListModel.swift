//
//  ListModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Foundation

struct ListModel: Decodable, Hashable {
    let id: String?
    let label: String?
    // children must be a non-nil property(It can be empty).
    // Otherwise it will conflict with @Binding property wrapper in the ItemsList.
    var children: [ListModel]
    // Since id property can be nil, it's necessary to add listID for icentification in swiftUI List.
    let listID = UUID()

    private enum CodingKeys: CodingKey {
        case id, label, children
    }

    // Implemented init manually to get default value for children property.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.children = try container.decodeIfPresent([ListModel].self, forKey: .children) ?? []
    }
}
