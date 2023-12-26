//
//  EntryDetailView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

struct EntryDetailView: View {
    // MARK: Public properties

    let titleText: String
    @StateObject var viewModel: EntryDetailViewModel

    // MARK: Private properties

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
