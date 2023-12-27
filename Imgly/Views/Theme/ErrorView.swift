//
//  ErrorView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 26.12.23.
//

import SwiftUI

/// An error screen that shows network related errors.
struct ErrorView: View {
    // MARK: Private properties

    private let error: NetworkError

    /// A text that shows the navigation title.
    private let titleText: String
    /// A shared manager that updates the theme and changes the ThemeSettingsButton visibility.
    @EnvironmentObject private var themeManager: ThemeManager

    // MARK: Initializers

    init(error: NetworkError, titleText: String) {
        self.error = error
        self.titleText = titleText
    }

    var body: some View {
        VStack(spacing: 0) {
            Image("error")
                .resizable()
                .frame(width: 95, height: 110)
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 50, trailing: 0))
                .foregroundStyle(themeManager.selectedTheme.primaryColor)
            Text(LocalizationKeys.error)
                .font(.custom(Fonts.Inter.bold, size: 22))
                .foregroundStyle(Colors.entryDetailGrey)
            Text(error.descriptionKey)
                .font(.custom(Fonts.Inter.semiBold, size: 18))
                .foregroundStyle(Colors.entryDetailGrey)
                .frame(maxWidth: 280)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 50, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.listBackgroundGrey)
        .appNavigationBarStyle()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(titleText)
                    .font(.custom(Fonts.Inter.semiBold, size: 20))
            }
        }
    }
}

#Preview {
    ErrorView(error: .noConnection, titleText: "")
        .environmentObject(ThemeManager())
}
