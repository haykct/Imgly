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
                .foregroundStyle(Color(red: 102 / 255, green: 104 / 255, blue: 108 / 255))
            Text(dateText)
                .font(.custom(Fonts.Inter.semiBold, size: 14))
                .foregroundStyle(Color(red: 70 / 255, green: 110 / 255, blue: 134 / 255))
                .lineLimit(2)
        }
    }
}

#Preview {
    EntryModificationInfoView(titleText: "", dateText: "")
}
