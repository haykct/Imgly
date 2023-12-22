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
    @State private var isColorSheetOpen = false

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
            .toolbarBackground(Colors.primaryBlue, for: .navigationBar)
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
                        Text("Hello")
                            .presentationDetents([.height(200)])
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
}
