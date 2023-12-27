//
//  ThemeManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

/// A manager that updates the theme and changes the ThemeSettingsButton visibility.
final class ThemeManager: ObservableObject {
    // MARK: Public properties

    @Published private(set) var isButtonVisible = true
    
    /// The theme that is currently selected in the app.
    @Published private(set) var selectedTheme: Theme = {
        let themeRawValue = UserDefaults.standard.integer(forKey: "themeRawValue")
        let themeType: ThemeType = .init(rawValue: themeRawValue) ?? .blue

        return themeType.makeTheme()
    }()

    // MARK: Public methods
    
    /// A methods that updates app's theme.
    /// - Parameter themeType: The theme type.
    func updateTheme(_ themeType: ThemeType) {
        UserDefaults.standard.set(themeType.rawValue, forKey: "themeRawValue")

        self.selectedTheme = themeType.makeTheme()
    }
    
    /// A method that toggles button's visibility.
    func toggleButtonVisibility() {
        isButtonVisible.toggle()
    }

    /// A method that changes button's visibility.
    func changeButtonvisibility(visible: Bool) {
        isButtonVisible = visible
    }
}
