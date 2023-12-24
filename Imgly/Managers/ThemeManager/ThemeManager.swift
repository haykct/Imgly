//
//  ThemeManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

final class ThemeManager: ObservableObject {
    // MARK: Public properties

    @Published private(set) var selectedTheme: Theme = {
        let themeRawValue = UserDefaults.standard.integer(forKey: "themeRawValue")
        let themeType: ThemeType = .init(rawValue: themeRawValue) ?? .blue

        return themeType.makeTheme()
    }()

    // MARK: Public methods

    func updateTheme(_ themeType: ThemeType) {
        UserDefaults.standard.set(themeType.rawValue, forKey: "themeRawValue")

        self.selectedTheme = themeType.makeTheme()
    }
}
