//
//  ThemeSettings.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ThemeSettings: View {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager
    @Binding private(set) var isColorSheetOpen: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Your Theme")
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
    ThemeSettings(isColorSheetOpen: .constant(false))
}
