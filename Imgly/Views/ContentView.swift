//
//  ContentView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 20.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationStack {
                ListContainer(listViewModel: ListViewModel())
            }

            ThemeSettingsButton()
                .offset(CGSize(width: -25, height: -30))
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
