//
//  ChordSetView.swift
//  ChordFlash
//

import SwiftUI

struct ChordSetView: View {
    let chordType: ChordType
    let mode: String

    private var chords: [Chord] {
        ChordLibrary.allChords.filter { $0.type == chordType }
    }

    private var title: String {
        "\(chordType.title) \(mode == "mastery" ? "Mastery" : "Practice")"
    }

    var body: some View {
        if mode == "mastery" {
            ChordMasteryView(title: title, chords: chords)
                .chordFlashNavigationTitle()
        } else {
            ChordPracticeView(title: title, chords: chords)
                .chordFlashNavigationTitle()
        }
    }
}

#Preview {
    NavigationStack {
        ChordSetView(chordType: .open, mode: "practice")
    }
}
