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

    // MARK: Public properties

    let id: String
    let createdBy: String
    let lastModifiedBy: String
    let description: String
    let createdAt: String
    let lastModifiedAt: String

    // MARK: Public methods

    static func makeViewData(model: EntryDetailModel) -> EntryDetailViewData {
        let dateManager = DateManager()
        var convertedCreatedAt = empty
        var convertedModifiedAt = empty

        if let createdAt = model.createdAt {
            convertedCreatedAt = dateManager.convert(date: createdAt,
                                                     from: fromFormat,
                                                     to: toFormat) ?? empty
        }

        if let lastModifiedAt = model.lastModifiedAt {
            convertedModifiedAt = dateManager.convert(date: lastModifiedAt,
                                                      from: fromFormat,
                                                      to: toFormat) ?? empty
        }

        return self.init(id: model.id ?? empty,
                         createdBy: model.createdBy ?? empty,
                         lastModifiedBy: model.lastModifiedBy ?? empty,
                         description: model.description ?? empty,
                         createdAt: convertedCreatedAt,
                         lastModifiedAt: convertedModifiedAt)
    }
}
