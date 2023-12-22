//
//  ThemeManager.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

enum ThemeType: CaseIterable {
    case blue, coral

    var color: Color {
        switch self {
        case .blue: .red
        case .coral: .green
        }
    }

    func makeTheme() -> Theme {
        switch self {
        case .blue: BlueTheme()
        case .coral: BlueTheme()
        }
    }
}
