//
//  ListView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ListView: View {
    // MARK: Public properties

    @StateObject var viewModel: ListViewModel

    var body: some View {
        if let error = viewModel.networkError {
            ErrorView(error: error, titleText: LocalizationKeys.list)
        } else {
            if viewModel.listItems.isEmpty {
                Spinner(titleText: LocalizationKeys.list)
                    .onFirstAppear {
                        viewModel.requestListData()
                    }
            } else {
                ListContentView(items: $viewModel.listItems)
            }
        }
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
        .environmentObject(ThemeManager())
}
