//
//  ListContainerView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ListContainerView: View {
    // MARK: Public properties

    @StateObject var viewModel: ListViewModel

    var body: some View {
        ItemsList(items: $viewModel.listItems)
            .onFirstAppear {
                viewModel.requestListData()
            }
    }
}

#Preview {
    ListContainerView(viewModel: ListViewModel())
        .environmentObject(ThemeManager())
}
