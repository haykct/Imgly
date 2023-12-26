//
//  EntryDetailViewData.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

struct EntryDetailViewData {
    // MARK: Private properties

    private static let fromFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    private static let toFormat = "d MMM YYYY"
    private static let empty = LocalizationKeys.notAvailable
    private let _createdAt: String
    private let _lastModifiedAt: String
    private let dateManager = DateManager()

    // MARK: Public properties

    let id: String
    let createdBy: String
    let lastModifiedBy: String
    let description: String
    private(set) lazy var createdAt = dateManager.convert(date: _createdAt,
                                                          from: Self.fromFormat,
                                                          to: Self.toFormat) ?? Self.empty
    private(set) lazy var lastModifiedAt = dateManager.convert(date: _lastModifiedAt,
                                                               from: Self.fromFormat,
                                                               to: Self.toFormat) ?? Self.empty

    // MARK: Initializers

    init(model: EntryDetailModel) {
        _createdAt = model.createdAt ?? Self.empty
        _lastModifiedAt = model.lastModifiedAt ?? Self.empty
        id = model.id ?? Self.empty
        createdBy = model.createdBy ?? Self.empty
        lastModifiedBy = model.lastModifiedBy ?? Self.empty
        description = model.description ?? Self.empty
    }
}
