//
//  ThemeSettingsButton.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ThemeSettingsButton: View {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager
    @State private var isColorSheetOpen = false

    var body: some View {
        Button(action: {
            isColorSheetOpen = true
        }, label: {
            Image("colorSettings")
                .resizable()
                .frame(width: 35, height: 35)
                .tint(Colors.listBackgroundGrey)
        })
        .frame(width: 70, height: 70)
        .background(
            themeManager.selectedTheme.secondaryColor
                .gradient
                .opacity(0.8)
        )
        .clipShape(.circle)
        .sheet(isPresented: $isColorSheetOpen) {
            ThemeSettings(isColorSheetOpen: $isColorSheetOpen)
                .presentationDetents([.height(200)])
        }
    }
}

#Preview {
    ThemeSettingsButton()
        .environmentObject(ThemeManager())
}
