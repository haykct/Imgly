//
//  EntryDetailRequest.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

struct EntryDetailRequest: Request {
    // MARK: Private properties

    private let id: String

    // MARK: Public properties

    var path: String { "frontend-tha/entries/\(id).json" }

    // MARK: Initializers

    init(id: String) {
        self.id = id
    }
}
