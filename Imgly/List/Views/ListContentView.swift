//
//  ListContentView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 24.12.23.
//

import SwiftUI

/// A view that represents the content of the ListView.
struct ListContentView: View {
    // MARK: Public properties

    /// A data that ListContentView shows.
    /// Updates the original data in ListViewModel after its own update.
    @Binding private(set) var items: [ListModel]

    var body: some View {
        List($items, id: \.listID, editActions: .all) { $item in
            NavigationLink {
                if let id = item.id {
                    EntryDetailView(titleText: item.label ?? "",
                                    viewModel: EntryDetailViewModel(id: id))
                } else {
                    ListContentView(items: $item.children)
                }
            } label: {
                ListRow(label: item.label ?? LocalizationKeys.notAvailable)
            }
            .listRowStyle()
        }
        .listStyle(.plain)
        .background(Colors.listBackgroundGrey)
        .scrollContentBackground(.hidden)
        .appNavigationBarStyle()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(LocalizationKeys.list)
                    .font(.custom(Fonts.Inter.semiBold, size: 20))
            }

            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
                    .font(.custom(Fonts.Inter.regular, size: 18))
            }
        }
    }
}

#Preview {
    ListContentView(items: .constant([]))
        .environmentObject(ThemeManager())
}
