//
//  EntryDetailContentView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 26.12.23.
//

import SwiftUI

/// A view that represents the content of the EntryDetaiView.
struct EntryDetailContentView: View {
    // MARK: Private properties

    /// A shared manager that updates the theme and changes the ThemeSettingsButton visibility.
    @EnvironmentObject private var themeManager: ThemeManager
    /// A datasource that shows the data in EntryDetailContentView.
    private let viewData: EntryDetailViewData
    /// A text that shows the navigation title.
    private let titleText: String

    // MARK: Initializers

    init(viewData: EntryDetailViewData, titleText: String) {
        self.viewData = viewData
        self.titleText = titleText
    }

    var body: some View {
        VStack(spacing: 0) {
            Image("file")
                .resizable()
                .frame(width: 95, height: 110)
                .padding(.top, 50)
                .foregroundStyle(themeManager.selectedTheme.primaryColor)
            VStack(alignment: .leading, spacing: 0) {
                Text(viewData.id)
                    .font(.custom(Fonts.Inter.bold, size: 20))
                    .lineLimit(3)
                    .foregroundStyle(Colors.entryDetailGrey)
                HStack {
                    EntryCreationInfoView(text: viewData.createdAt)
                    EntryCreationInfoView(text: viewData.createdBy)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 35, leading: 18, bottom: 0, trailing: 18))
            VStack(alignment: .leading, spacing: 5) {
                EntryModificationInfoView(titleText: LocalizationKeys.lastModifiedAt,
                                          dateText: viewData.lastModifiedAt)
                EntryModificationInfoView(titleText: LocalizationKeys.lastModifiedBy,
                                          dateText: viewData.lastModifiedBy)
                Divider()
                    .frame(height: 1.5)
                    .overlay(Colors.listDividerGrey)
                    .padding([.top, .bottom], 15)
                Text(LocalizationKeys.entryDescription)
                    .font(.custom(Fonts.Inter.bold, size: 20))
                    .foregroundStyle(Colors.entryDetailGrey)
                    .padding(.bottom, 10)
                ScrollView {
                    Text(viewData.description)
                        .font(.custom(Fonts.Inter.regular, size: 16))
                        .lineSpacing(6)
                        .foregroundStyle(Colors.entryDetailGrey)
                        .padding(.bottom, 12)
                }
                .scrollIndicators(.hidden)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 15, leading: 18, bottom: 0, trailing: 18))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Colors.listBackgroundGrey)
        .appNavigationBarStyle()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(titleText)
                    .font(.custom(Fonts.Inter.semiBold, size: 20))
            }
        }
        .onTapGesture {
            themeManager.toggleButtonVisibility()
        }
        .onAppear {
            themeManager.changeButtonvisibility(visible: false)
        }
        .onDisappear {
            themeManager.changeButtonvisibility(visible: true)
        }
    }
}
