//
//  ThemeManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

final class ThemeManager: ObservableObject {
    // MARK: Private properties

    @Published private(set) var selectedTheme: Theme = BlueTheme()

    // MARK: Public methods

    func updateTheme(_ theme: Theme) {
        self.selectedTheme = theme
    }
}
