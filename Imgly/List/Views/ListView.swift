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
        if viewModel.listItems.isEmpty {
            Spinner(titleText: LocalizationKeys.list)
                .navigationBarTitleDisplayMode(.inline)
                .onFirstAppear {
                    viewModel.requestListData()
                }
        } else {
            ListContentView(items: $viewModel.listItems)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
        .environmentObject(ThemeManager())
}
