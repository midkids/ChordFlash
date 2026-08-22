//
//  ContentView.swift
//  ChordFlash
//
//  Created by Myron Snelson on 8/2/26.
//
// Future Improvements:
// 1. Create a mastery screen with an option off
//    ContentView
// 2. In Mastery, show random chords but keep track
//    of the chords shown and allow the
//    user to indicate whether or not they know a chord
//    and then do not show that chord any longer
//    in that session
// 3. Create a settings screen that allows the user to
//    customize the behavior of the mastery screen
//    a. keep showing chords randomly until they are all
//       shown once, keeping track of the got-its,
//       and then present a score (default)
//    b. keep showing chords until they are all indicated
//       as got-its by the user
// 4. Set a default limit of all chords on the number
//    of random chords to be shown before giving a score
//    but allow a lower number to be set

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
                            .font(.title)

                        Text("Choose a chord set")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text("and")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text("Practice or Mastery Mode")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    VStack(spacing: 14) {
                        Text("Open Chords")
                            .font(.title)
                        NavigationLink {
                            OpenChordView(mode: "practice")
                        } label: {
                            MenuRow(title: "Practice Mode", systemImage: "music.note.list")
                        }
                        NavigationLink {
                            OpenChordView(mode: "mastery")
                        } label: {
                            MenuRow(title: "Mastery Mode", systemImage: "guitars")
                        }
                        Text("Bar Chords")
                            .font(.title)
                        NavigationLink {
                            BarChordView(mode: "practice")
                        } label: {
                            MenuRow(title: "Practice Mode", systemImage: "music.note.list")
                        }
                        NavigationLink {
                            BarChordView(mode: "mastery")
                        } label: {
                            MenuRow(title: "Mastery Mode", systemImage: "guitars")
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
