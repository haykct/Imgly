//
//  LabelList.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

struct LabelList: View {
    // MARK: Private properties

    @State private var labels = ["David Anderson", "Jack", "Bob", "Tommy"]

    var body: some View {
        List($labels, id: \.self, editActions: .all) { $label in
            LabelListRow(label: label)
        }
        .listStyle(.plain)
        .background(Colors.listBackgroundGrey)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    LabelList()
        .environmentObject(ThemeManager())
}
