//
//  ContentView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 20.12.23.
//

import SwiftUI
import Swinject

struct ContentView: View {
    // MARK: Private properties

    @EnvironmentObject private var themeManager: ThemeManager
    @State private var users = ["David Anderson", "Jack", "Bob", "Tommy"]
    @State private var isColorSheetOpen = false

    var body: some View {
        NavigationStack {
            List($users, id: \.self, editActions: .all) { $user in
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(themeManager.theme.secondaryColor)
                            .frame(width: 15, height: 15)
                        Text(user)
                            .font(.custom(Fonts.Inter.medium, size: 20))
                            .padding([.top, .bottom], 13)
                            .frame(maxHeight: .infinity)
                            .foregroundStyle(Colors.listTextGrey)
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(Colors.listDividerGrey)
                }
                .listRowBackground(Colors.listBackgroundGrey)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(themeManager.theme.primaryColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .listStyle(.plain)
            .background(Colors.listBackgroundGrey)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isColorSheetOpen = true
                    }, label: {
                        Image("colorSettings")
                            .resizable()
                            .frame(width: 23, height: 23)
                    })
                    .sheet(isPresented: $isColorSheetOpen) {
                        VStack(alignment: .leading) {
                            Text("Select Your Theme")
                                .font(.custom(Fonts.Inter.medium, size: 24))
                                .foregroundStyle(Colors.listTextGrey)
                                .padding([.leading, .top], 20)
                            HStack {
                                ForEach(ThemeType.allCases, id: \.self) { type in
                                    Spacer()
                                    Button {
                                        let theme = type.makeTheme()

                                        themeManager.updateTheme(theme)
                                        isColorSheetOpen = false
                                    } label: {
                                        Circle()
                                            .fill(type.primaryColor.gradient.opacity(0.8))
                                    }
                                    .frame(width: 50, height: 50)
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 18)
                            Spacer()
                        }
                        .presentationDetents([.height(200)])
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Colors.listBackgroundGrey)
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("Title")
                        .font(.custom(Fonts.Inter.semiBold, size: 20))
                }

                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .font(.custom(Fonts.Inter.regular, size: 20))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
