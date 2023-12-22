//
//  ContentView.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 20.12.23.
//

import SwiftUI
import Swinject

struct ContentView: View {
    @State private var users = ["David", "Jack", "Bob", "Tommy"]

    var body: some View {
        NavigationStack {
            List($users, id: \.self, editActions: .all) { $user in
                VStack(alignment: .leading, spacing: 0) {
                    Text(user)
                        .font(.custom(Fonts.Inter.medium, size: 20))
                        .padding([.top, .bottom], 13)
                        .frame(maxHeight: .infinity)
                        .foregroundStyle(Colors.listTextGrey)
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
            .toolbarBackground(Colors.navBarBlue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .listStyle(.plain)
            .background(Colors.listBackgroundGrey)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {

                    }, label: {
                        Image("colorSettings")
                            .resizable()
                            .frame(width: 23, height: 23)
                    })
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
}
