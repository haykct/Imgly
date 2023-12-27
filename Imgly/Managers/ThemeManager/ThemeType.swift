//
//  ThemeManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

/// A type for identifying the theme.
enum ThemeType: Int, CaseIterable {
    case blue, coral, brown, purple

    var primaryColor: Color {
        switch self {
        case .blue: Colors.primaryBlue
        case .coral: Colors.primaryCoral
        case .brown: Colors.primaryBrown
        case .purple: Colors.primaryPurple
        }
    }

    func makeTheme() -> Theme {
        switch self {
        case .blue: BlueTheme()
        case .coral: CoralTheme()
        case .brown: BrownTheme()
        case .purple: PurpleTheme()
        }
    }
}
