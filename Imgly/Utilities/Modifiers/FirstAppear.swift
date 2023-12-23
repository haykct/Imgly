//
//  FirstAppear.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import SwiftUI

private struct FirstAppear: ViewModifier {
    // MARK: Private properties

    private let callback: () -> Void
    @State private var hasAppeared = false

    // MARK: Initializers

    init(callback: @escaping () -> Void) {
        self.callback = callback
    }

    // MARK: Public methods

    func body(content: Content) -> some View {
        content.onAppear {
            if hasAppeared { return }

            hasAppeared = true
            callback()
        }
    }
}

extension View {
    func onFirstAppear(_ callback: @escaping () -> Void) -> some View {
        modifier(FirstAppear(callback: callback))
    }
}
