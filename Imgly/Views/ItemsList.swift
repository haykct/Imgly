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
            NavigationLink {
                if item.children.isEmpty {

                } else {
                    ItemsList(items: $item.children)
                }
            } label: {
                ListRow(label: item.label ?? LocalizationKeys.notAvailable)
            }
            .listRowBackground(Colors.listBackgroundGrey)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        .listStyle(.plain)
        .background(Colors.listBackgroundGrey)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ItemsList(items: .constant([]))
}
