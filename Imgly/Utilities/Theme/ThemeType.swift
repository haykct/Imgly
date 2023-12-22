//
//  ThemeManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

enum ThemeType: CaseIterable {
    case blue, coral, green, gray

    var color: Color {
        switch self {
        case .blue: Colors.primaryBlue
        case .coral: .red
        case .green: .green
        case .gray: Color.gray
        }
    }

    func makeTheme() -> Theme {
        switch self {
        case .blue: BlueTheme()
        case .coral: RedTheme()
        case .green: BlueTheme()
        case .gray: RedTheme()
        }
    }
}
