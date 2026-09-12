//
//  ContentView.swift
//  ChordFlash
//
//  Created by Myron Snelson on 8/2/26.
//
// Future Improvements:
// 1. Create a mastery screen with an option off
//    ContentView - done
// 2. In Mastery, show random chords but keep track
//    of the chords shown and allow the
//    user to indicate whether or not they know a chord
//    via a "Got it!" button
//    and then do not show that chord any longer
//    in that session if they know it - done
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
// 5. Create a search field for both open and bar chords

import SwiftUI

extension Color {
    init(hex: Int) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255.0,
            green: Double((hex >> 8) & 0xff) / 255.0,
            blue: Double(hex & 0xff) / 255.0
        )
    }

    static let chordFlashForeground = Color(hex: 0x2B8F8A)
    static let chordFlashSecondary = Color(hex: 0xE5B854)
    static let chordFlashBackground = Color(hex: 0xE8F5F0)
}

extension View {
    func chordFlashNavigationTitle(_ title: String = "ChordFlash") -> some View {
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.chordFlashForeground)
                }
            }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.chordFlashBackground
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image("ChordFlashHeader")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .accessibilityLabel("Guitar fretboard with chord flashcards")

                    VStack(spacing: 6) {
                        Text("Menu")
                        //    .font(.largeTitle.bold())
                            .font(.title)
                            .foregroundStyle(Color.chordFlashSecondary)

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
                            .foregroundStyle(Color.chordFlashSecondary)
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
                            .foregroundStyle(Color.chordFlashSecondary)
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
            .chordFlashNavigationTitle()
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
