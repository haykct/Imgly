//
//  ContentView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 20.12.23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager
    @State private var isColorSheetOpen = false

    var body: some View {
        NavigationStack {
            LabelList()
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(themeManager.selectedTheme.primaryColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
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

                    ToolbarItem(placement: .principal) {
                        Text(LocalizationKeys.list)
                            .font(.custom(Fonts.Inter.semiBold, size: 20))
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                            .font(.custom(Fonts.Inter.regular, size: 20))
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
