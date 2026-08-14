//
//  BarChordView.swift
//  ChordFlash
//

import SwiftUI

struct BarChordView: View {
    private let barChords = [
        Chord(
            name: "F",
            fingering: ["1", "3", "3", "2", "1", "1"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "F major bar chord"
        )
    ]

    var body: some View {
        ChordPracticeView(title: "Bar Chords", chords: barChords)
            .navigationTitle("ChordFlash")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BarChordView()
    }
}
