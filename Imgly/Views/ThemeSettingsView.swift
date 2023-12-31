//
//  ThemeSettingsView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ThemeSettingsView: View {
    // MARK: Public properties

    @Binding private(set) var isColorSheetOpen: Bool

    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizationKeys.selectTheme)
                .font(.custom(Fonts.Inter.medium, size: 24))
                .foregroundStyle(Colors.listTextGrey)
                .padding([.leading, .top], 20)
            HStack {
                ForEach(ThemeType.allCases, id: \.self) { themeType in
                    Spacer()
                    Button {
                        themeManager.updateTheme(themeType)
                        isColorSheetOpen = false
                    } label: {
                        if themeType == themeManager.selectedTheme.type {
                            Image(systemName: "checkmark")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(
                                    themeType.primaryColor
                                        .gradient
                                        .opacity(0.8)
                                )
                                .clipShape(.circle)
                                .tint(.white)
                        } else {
                            Circle()
                                .fill(
                                    themeType.primaryColor
                                    .gradient
                                    .opacity(0.8)
                                )
                        }
                    }
                    .frame(width: 50, height: 50)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 18)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.listBackgroundGrey)
    }
}

#Preview {
    ThemeSettingsView(isColorSheetOpen: .constant(false))
        .environmentObject(ThemeManager())
}
