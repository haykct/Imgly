//
//  ThemeSettingsButton.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ThemeSettingsButton: View {
    // MARK: Private properties

    @State private var isColorSheetOpen = false

    var body: some View {
        Button(action: {
            isColorSheetOpen = true
        }, label: {
            Image("colorSettings")
                .resizable()
                .frame(width: 23, height: 23)
        })
        .sheet(isPresented: $isColorSheetOpen) {
            ThemeSettings(isColorSheetOpen: $isColorSheetOpen)
                .presentationDetents([.height(200)])
        }
    }
}

#Preview {
    ThemeSettingsButton()
}
