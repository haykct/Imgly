//
//  EntryDetailView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

/// A view that shows the list detail info.
struct EntryDetailView: View {
    // MARK: Public properties

    /// A text that shows the navigation title.
    let titleText: String
    /// A bridging layer for the EntryDetailModel and the EntryDetailView.
    @StateObject var viewModel: EntryDetailViewModel

    // MARK: Private properties

    /// A shared manager that updates the theme and changes the ThemeSettingsButton visibility.
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        if let error = viewModel.networkError {
            ErrorView(error: error, titleText: titleText)
        } else {
            if let viewData = viewModel.viewData {
                EntryDetailContentView(viewData: viewData, titleText: titleText)
            } else {
                Spinner(titleText: titleText)
                    .onFirstAppear {
                        viewModel.requestDetailData()
                    }
            }
        }
    }
}

#Preview {
    EntryDetailView(titleText: "", viewModel: EntryDetailViewModel(id: ""))
        .environmentObject(ThemeManager())
}
