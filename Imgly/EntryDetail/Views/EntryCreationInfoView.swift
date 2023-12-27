//
//  EntryCreationInfoView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

/// A view that shows an info about the entry creation date and author.
struct EntryCreationInfoView: View {
    // MARK: Private properties

    private let text: String
    // A shared manager that updates the theme and changes the ThemeSettingsButton visibility.
    @EnvironmentObject private var themeManager: ThemeManager

    // MARK: Initializers

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.custom(Fonts.Inter.medium, size: 14))
            .foregroundStyle(.white)
            .padding(10)
            .frame(maxHeight: 55)
            .background(themeManager.selectedTheme.primaryColor)
            .clipShape(.rect(cornerRadius: 7))
    }
}

#Preview {
    EntryCreationInfoView(text: "")
        .environmentObject(ThemeManager())
}
