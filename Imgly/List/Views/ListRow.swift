//
//  ListRow.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

/// A row that represents a single item in the ListContentView.
struct ListRow: View {
    // MARK: Private properties

    private let label: String
    /// A shared manager that updates the theme and changes the ThemeSettingsButton visibility.
    @EnvironmentObject private var themeManager: ThemeManager

    // MARK: Initializers

    init(label: String) {
        self.label = label
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                RoundedRectangle(cornerRadius: 3)
                    .fill(themeManager.selectedTheme.secondaryColor)
                    .frame(width: 14, height: 14)
                Text(label)
                    .font(.custom(Fonts.Inter.medium, size: 20))
                    .padding([.top, .bottom], 13)
                    .frame(maxHeight: .infinity)
                    .foregroundStyle(Colors.listTextGrey)
            }
            Divider()
                .frame(height: 1)
                .overlay(Colors.listDividerGrey)
        }
    }
}

#Preview {
    ListRow(label: "Text")
        .environmentObject(ThemeManager())
}
