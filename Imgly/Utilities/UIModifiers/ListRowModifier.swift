//
//  ListRowModifier.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 24.12.23.
//

import SwiftUI

private struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Colors.listBackgroundGrey)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

extension View {
    func listRowStyle() -> some View {
        modifier(ListRowModifier())
    }
}
