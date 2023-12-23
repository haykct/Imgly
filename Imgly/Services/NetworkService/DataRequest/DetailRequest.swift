//
//  DetailRequest.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

struct DetailRequest: Request {
    // MARK: Private properties

    private let id: String

    // MARK: Public properties

    var path: String { "frontend-tha/data.json" + id }

    // MARK: Initializers

    init(id: String) {
        self.id = id
    }
}
