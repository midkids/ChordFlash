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
            frets: ["5", "7", "7", "6", "5", "5"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "A major E-based bar chord"
        ), Chord(
            name: "Bb",
            frets: ["x", "1", "3", "3", "3", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "B flat major A-based bar chord"
        ), Chord(
            name: "Bb",
            frets: ["6", "8", "8", "7", "6", "6"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "B flat major E-based bar chord"
        ), Chord(
            name: "B",
            frets: ["x", "2", "4", "4", "4", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "B major A-based bar chord"
        ), Chord(
            name: "B",
            frets: ["7", "9", "9", "8", "7", "7"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "B major E-based bar chord"
        ), Chord(
            name: "C",
            frets: ["x", "3", "5", "5", "5", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "C major A-based bar chord"
        ), Chord(
            name: "C#",
            frets: ["x", "4", "6", "6", "6", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "C# major A-based bar chord"
        ), Chord(
            name: "D",
            frets: ["x", "5", "7", "7", "7", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "D major A-based bar chord"
        ), Chord(
            name: "D#",
            frets: ["x", "6", "8", "8", "8", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "D# major A-based bar chord"
        ), Chord(
            name: "E",
            frets: ["x", "7", "9", "9", "9", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "E major A-based bar chord"
        ), Chord(
            name: "F",
            frets: ["1", "3", "3", "2", "1", "1"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "F major E-based bar chord"
        ), Chord(
            name: "F#",
            frets: ["2", "4", "4", "3", "2", "2"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "F major E-based bar chord"
        ),
        Chord(
            name: "G",
            frets: ["3", "5", "5", "4", "3", "3"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "G major E-based bar chord"
        ),
        Chord(
            name: "G#",
            frets: ["4", "6", "6", "5", "4", "4"],
            fingerNumbers: ["1", "3", "4", "2", "1", "1"],
            notes: "G# major E-based bar chord"
        ),
        Chord(
            name: "Gm",
            frets: ["3", "5", "5", "3", "3", "3"],
            fingerNumbers: ["1", "3", "4", "1", "1", "1"],
            notes: "G minor E-based bar chord"
        ),
        Chord(
            name: "G7",
            frets: ["3", "5", "3", "4", "3", "3"],
            fingerNumbers: ["1", "3", "1", "2", "1", "1"],
            notes: "G dominant seventh E-based bar chord"
        ),
        Chord(
            name: "Gm7",
            frets: ["3", "5", "3", "3", "3", "3"],
            fingerNumbers: ["1", "3", "1", "1", "1", "1"],
            notes: "G minor seventh E-based bar chord"
        ),
        Chord(
            name: "G7sus",
            frets: ["3", "5", "3", "5", "3", "3"],
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
