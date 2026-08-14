//
//  ContentView.swift
//  ChordFlash
//
//  Created by Myron Snelson on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack(spacing: 28) {
                    VStack(spacing: 6) {
                        Text("Menu")
                        //    .font(.largeTitle.bold())
                            .font(.headline)

                        Text("Choose a chord set")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    VStack(spacing: 14) {
                        NavigationLink {
                            OpenChordView()
                        } label: {
                            MenuRow(title: "Open Chords", systemImage: "music.note.list")
                        }

                        NavigationLink {
                            BarChordView()
                        } label: {
                            MenuRow(title: "Bar Chords", systemImage: "guitars")
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .navigationTitle("ChordFlash")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("ChordFlash")
                        .font(.title.bold())
                }
            }
        }
    }
}

struct MenuRow: View {
    let title: String
    let systemImage: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: systemImage)
                .font(.title2)
                .frame(width: 32)
                .foregroundStyle(.tint)

            Text(title)
                .font(.title3.weight(.semibold))
                .foregroundStyle(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: 420)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    ContentView()
}
