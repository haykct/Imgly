//
//  ItemsList.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 24.12.23.
//

import SwiftUI

struct ItemsList: View {
    // MARK: Public properties

    @Binding private(set) var items: [ListModel]

    var body: some View {
        List($items, id: \.listID, editActions: .all) { $item in
            if item.children.isEmpty {
                if item.id != nil {
                    NavigationLink {
                        EntryDetailView()
                    } label: {
                        ListRow(label: item.label ?? LocalizationKeys.notAvailable)
                    }
                    .listRowStyle()
                } else {
                    ListRow(label: item.label ?? LocalizationKeys.notAvailable)
                        .listRowStyle()
                }
            } else {
                NavigationLink {
                    ItemsList(items: $item.children)
                } label: {
                    ListRow(label: item.label ?? LocalizationKeys.notAvailable)
                }
                .listRowStyle()
            }
        }
        .listStyle(.plain)
        .background(Colors.listBackgroundGrey)
        .scrollContentBackground(.hidden)
        .navigationBarTitleDisplayMode(.inline)
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
    ItemsList(items: .constant([]))
        .environmentObject(ThemeManager())
}
