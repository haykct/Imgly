//
//  EntryDetailModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import Foundation

/// A model that decodes data from the network for the EntryDetailView.
struct EntryDetailModel: Decodable {
    let id: String?
    let createdAt: String?
    let createdBy: String?
    let lastModifiedAt: String?
    let lastModifiedBy: String?
    let description: String?
}
