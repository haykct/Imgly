//
//  Spinner.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 26.12.23.
//

import SwiftUI

/// A spinner that indicates the loading status during asynchronous processes.
struct Spinner: View {
    // MARK: Private properties
    /// A text that shows the navigation title.
    private let titleText: String

    // MARK: Initializers

    init(titleText: String) {
        self.titleText = titleText
    }

    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.listBackgroundGrey)
            .appNavigationBarStyle()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(titleText)
                        .font(.custom(Fonts.Inter.semiBold, size: 20))
                }
            }
    }
}

#Preview {
    Spinner(titleText: "")
}
