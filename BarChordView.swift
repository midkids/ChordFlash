//
//  BarChordView.swift
//  ChordFlash
//

import SwiftUI

struct BarChordView: View {
    let mode: String
    
    private let barChords = [
        Chord(
            name: "A",
            fingering: ["5", "7", "7", "6", "5", "5"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "A major E-based bar chord"
        ),
        Chord(
            name: "Bb",
            fingering: ["6", "8", "8", "7", "6", "6"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "B flat major E-based bar chord"
        ),Chord(
            name: "F",
            fingering: ["1", "3", "3", "2", "1", "1"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "F major E-based bar chord"
        ),
        Chord(
            name: "G",
            fingering: ["3", "5", "5", "4", "3", "3"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "G major E-based bar chord"
        ),
        Chord(
            name: "Gm",
            fingering: ["3", "5", "5", "3", "3", "3"],
            fingerNumbers: ["1", "3", "4", "1", "1", "1"],
            notes: "G minor E-based bar chord"
        ),
        Chord(
            name: "G7",
            fingering: ["3", "5", "3", "4", "3", "3"],
            fingerNumbers: ["1", "3", "1", "2", "1", "1"],
            notes: "G dominant seventh E-based bar chord"
        ),
        Chord(
            name: "Gm7",
            fingering: ["3", "5", "3", "3", "3", "3"],
            fingerNumbers: ["1", "3", "1", "1", "1", "1"],
            notes: "G minor seventh E-based bar chord"
        ),
        Chord(
            name: "G7sus",
            fingering: ["3", "5", "3", "5", "3", "3"],
            fingerNumbers: ["1", "3", "1", "4", "1", "1"],
            notes: "A minor seventh E-based bar chord"
        )
    ]

    var body: some View {
        if mode == "mastery" {
            ChordMasteryView(title: "Bar Chords Mastery", chords: barChords)
                .navigationTitle("ChordFlash")
                .navigationBarTitleDisplayMode(.inline)
        } else {
            ChordPracticeView(title: "Bar Chords Practice", chords: barChords)
                .navigationTitle("ChordFlash")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        BarChordView(mode: "practice")
    }
}
