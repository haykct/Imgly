//
//  DetailView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import SwiftUI

struct DetailView: View {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 0) {
            Image("file")
                .resizable()
                .frame(width: 95, height: 110)
                .padding(.top, 80)
                .foregroundStyle(themeManager.selectedTheme.secondaryColor)
            VStack(alignment: .leading, spacing: 0) {
                Text("e20d9958-abff-59f4-8561-0c76292dad73")
                    .font(.custom(Fonts.Inter.bold, size: 20))
                    .lineLimit(3)
                    .foregroundStyle(Color(red: 102 / 255, green: 104 / 255, blue: 108 / 255))
                HStack {
                    EntryCreationInfoView(text: "14-07-2024 02:33 pm")
                    EntryCreationInfoView(text: "ciftuzfaf@ovwatvuz.ug")
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 50, leading: 18, bottom: 0, trailing: 18))
            VStack(alignment: .leading, spacing: 5) {
                EntryModificationInfoView(titleText: LocalizationKeys.lastModifiedAt,
                                          dateText: "17-09-2024 08:24 pm")
                EntryModificationInfoView(titleText: LocalizationKeys.lastModifiedBy,
                                          dateText: "fuh@wimumamok.lr")
                Text("Description")
                    .font(.custom(Fonts.Inter.bold, size: 20))
                    .foregroundStyle(Color(red: 102 / 255, green: 104 / 255, blue: 108 / 255))
                    .padding([.top, .bottom], 10)
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
                    .foregroundStyle(Color(red: 102 / 255, green: 104 / 255, blue: 108 / 255))
                    .padding(.bottom, 12)
                }
                .scrollIndicators(.hidden)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 15, leading: 18, bottom: 0, trailing: 18))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Colors.listBackgroundGrey)
    }
}

#Preview {
    DetailView()
        .environmentObject(ThemeManager())
}
