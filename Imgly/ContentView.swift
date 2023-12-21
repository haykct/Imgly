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
            VStack(spacing: 0) {
                Image(systemName: "doc.badge.gearshape.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding()
                    .background(Color(red: 127 / 255, green: 214 / 255, blue: 191 / 255))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                List($users, id: \.self, editActions: .all) { $user in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(user)
                            .padding([.top, .bottom], 12)
                            .frame(maxHeight: .infinity)
                            .fontWeight(.medium)
                            .foregroundStyle(Color(red: 120 / 255, green: 120 / 255, blue: 120 / 255))
                        Divider()
                            .frame(height: 1)
                            .overlay(Color(red: 225 / 255, green: 225 / 255, blue: 225 / 255))
                    }
                    .listRowBackground(Color(red: 247 / 255, green: 249 / 255, blue: 250 / 255))
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color(red: 86 / 255, green: 124 / 255, blue: 150 / 255), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .background(Color(red: 247 / 255, green: 249 / 255, blue: 250 / 255))
                .listStyle(.plain)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "gearshape.fill")
                    }

                    ToolbarItem(placement: .principal) {
                        Text("Title")
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                }
            }
            .background(Color(red: 247 / 255, green: 249 / 255, blue: 250 / 255))
        }
    }
}

#Preview {
    ContentView()
}
