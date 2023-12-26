//
//  EntryModificationInfoView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

struct EntryModificationInfoView: View {
    // MARK: Private properties

    private let titleText: String
    private let dateText: String

    // MARK: Initializers

    init(titleText: String, dateText: String) {
        self.titleText = titleText
        self.dateText = dateText
    }

    var body: some View {
        HStack {
            Text(titleText)
                .font(.custom(Fonts.Inter.medium, size: 15))
                .foregroundStyle(Colors.entryDetailGrey)
            Text(dateText)
                .font(.custom(Fonts.Inter.semiBold, size: 14))
                .foregroundStyle(Colors.entryDetailBlue)
                .lineLimit(2)
        }
    }
}

#Preview {
    EntryModificationInfoView(titleText: "", dateText: "")
}
