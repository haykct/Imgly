//
//  MainView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 20.12.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationStack {
                ListView(viewModel: ListViewModel())
                    .navigationBarTitleDisplayMode(.inline)
            }

            ThemeSettingsButton()
                .offset(CGSize(width: -25, height: -30))
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ThemeManager())
}
