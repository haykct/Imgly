//
//  ListModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

struct ListModel: Decodable {
    var id: String?
    var label: String?
    var children: [ListModel]?
}
