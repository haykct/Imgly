//
//  EntryDetailView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

struct EntryDetailView: View {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 0) {
            Image("file")
                .resizable()
                .frame(width: 95, height: 110)
                .padding(.top, 50)
                .foregroundStyle(themeManager.selectedTheme.primaryColor)
            VStack(alignment: .leading, spacing: 0) {
                Text("e20d9958-abff-59f4-8561-0c76292dad73")
                    .font(.custom(Fonts.Inter.bold, size: 20))
                    .lineLimit(3)
                    .foregroundStyle(Colors.entryDetailGrey)
                HStack {
                    EntryCreationInfoView(text: "14-07-2024 02:33 pm")
                    EntryCreationInfoView(text: "ciftuzfaf@ovwatvuz.ug")
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 35, leading: 18, bottom: 0, trailing: 18))
            VStack(alignment: .leading, spacing: 5) {
                EntryModificationInfoView(titleText: LocalizationKeys.lastModifiedAt,
                                          dateText: "17-09-2024 08:24 pm")
                EntryModificationInfoView(titleText: LocalizationKeys.lastModifiedBy,
                                          dateText: "fuh@wimumamok.lr")
                Divider()
                    .frame(height: 1.5)
                    .overlay(Colors.listDividerGrey)
                    .padding([.top, .bottom], 15)
                Text(LocalizationKeys.entryDescription)
                    .font(.custom(Fonts.Inter.bold, size: 20))
                    .foregroundStyle(Colors.entryDetailGrey)
                    .padding(.bottom, 10)
                ScrollView {
                    Text("""
                        Rebongig joeto gusku tiwwa vapumed cupi ni dep tijur \
                        uc rifrezlap peha dobpu gonnehe jija doduvce. \
                        Mis silot welug oho gitofpud cif eh ec awara voc volupif fi soimja. \
                        Ovi sovwombov farol bajifo vumutu zitoci eb hor dujot efinal \
                        fikrubebi wakimah toh rasovumi tipdolum ga wakorca ma. \
                        Azonev jajrali atu sufvegta ozudogin iplecvit futaki segjajem \
                        kowrize reroref lacevlu gen soufino hud defize filtimot.
                        """)
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
                Text("Entry 1")
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

#Preview {
    EntryDetailView()
        .environmentObject(ThemeManager())
}
