//
//  ListContainerView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct ListContainerView: View {
    // MARK: Public properties

    @StateObject var listViewModel: ListViewModel

    var body: some View {
        ItemsList(items: $listViewModel.listItems)
            .onFirstAppear {
                listViewModel.requestListData()
            }
    }
}

#Preview {
    ListContainerView(listViewModel: ListViewModel())
        .environmentObject(ThemeManager())
}
