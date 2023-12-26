//
//  AppNavigationBarModifier.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 24.12.23.
//

import SwiftUI

private struct AppNavigationBarModifier: ViewModifier {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager

    func body(content: Content) -> some View {
        content
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(themeManager.selectedTheme.primaryColor, for: .navigationBar)
    }
}

extension View {
    func appNavigationBarStyle() -> some View {
        modifier(AppNavigationBarModifier())
    }
}
