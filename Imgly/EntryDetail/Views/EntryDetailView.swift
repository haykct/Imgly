//
//  EntryDetailView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

struct EntryDetailView: View {
    // MARK: Public properties

    @StateObject var viewModel: EntryDetailViewModel

    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager
    private var content: some View {
        // Used property and AnyView to be able to add guard var inside @ViewBuilder
        guard var viewData = viewModel.viewData else {
            return AnyView(
                VStack {
                    ProgressView()
                }
                    .frame(maxHeight: .infinity)
            )
        }

        let body = VStack(spacing: 0) {
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

        return AnyView(body)
    }

    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Colors.listBackgroundGrey)
            .appNavigationBarStyle()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Entry 1")
                        .font(.custom(Fonts.Inter.semiBold, size: 20))
                }
            }
            .onTapGesture {
                themeManager.toggleButtonVisibility()
            }
            .onFirstAppear {
                viewModel.requestDetailData()
            }
            .onAppear {
                themeManager.changeButtonvisibility(visible: false)
            }
            .onDisappear {
                themeManager.changeButtonvisibility(visible: true)
            }
    }
}

#Preview {
    EntryDetailView(viewModel: EntryDetailViewModel(id: ""))
        .environmentObject(ThemeManager())
}
