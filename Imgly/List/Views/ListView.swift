//
//  ListView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

/// A view that shows the list data.
struct ListView: View {
    // MARK: Public properties

    /// A bridging layer for the ListModel and the ListView.
    @StateObject var viewModel: ListViewModel

    var body: some View {
        VStack {
            if let error = viewModel.networkError {
                ErrorView(error: error, titleText: LocalizationKeys.list)
            } else {
                if viewModel.listItems == nil {
                    Spinner(titleText: LocalizationKeys.list)
                } else {
                    // Wrapped inside a Binding to be able to unwrap optional listItems
                    ListContentView(items: Binding($viewModel.listItems)!)
                }
            }
        }
        .onFirstAppear {
            viewModel.requestListData()
        }
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
        .environmentObject(ThemeManager())
}
