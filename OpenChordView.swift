//
//  OpenChordView.swift
//  ChordFlash
//

import SwiftUI

struct OpenChordView: View {
    let mode: String

    private let openChords = [
        Chord(
            name: "Am7",
            frets: ["x", "0", "2", "0", "1", "0"],
            fingerNumbers: ["", "", "2", "", "1", ""],
            notes: "A minor seventh"
        ),
        Chord(
            name: "A",
            frets: ["x", "0", "2", "2", "2", "0"],
            fingerNumbers: ["", "", "2", "1", "3", ""],
            notes: "A major"
        ),
        Chord(
            name: "Amaj7",
            frets: ["x", "0", "2", "1", "2", "0"],
            fingerNumbers: ["", "", "2", "1", "3", ""],
            notes: "A major seventh"
        ),
        Chord(
            name: "A7",
            frets: ["x", "0", "2", "0", "2", "0"],
            fingerNumbers: ["", "", "1", "", "2", ""],
            notes: "A dominant seventh"
        ),
        Chord(
            name: "Am",
            frets: ["x", "0", "2", "2", "1", "0"],
            fingerNumbers: ["", "", "2", "3", "1", ""],
            notes: "A minor"
        ),
        Chord(
            name: "Bb",
            frets: ["x", "1", "3", "3", "3", "x"],
            fingerNumbers: ["", "1", "3", "3", "3", ""],
            notes: "B flat major"
        ),
        Chord(
            name: "B7",
            frets: ["x", "2", "1", "2", "0", "2"],
            fingerNumbers: ["", "2", "1", "3", "", "4"],
            notes: "B dominant seventh"
        ),
        Chord(
            name: "Bm",
            frets: ["x", "2", "4", "4", "3", "x"],
            fingerNumbers: ["", "1", "3", "4", "2", ""],
            notes: "B minor"
        ),
        Chord(
            name: "C",
            frets: ["x", "3", "2", "0", "1", "0"],
            fingerNumbers: ["", "3", "2", "", "1", ""],
            notes: "C major"
        ),
        Chord(
            name: "Cmaj7",
            frets: ["x", "3", "2", "0", "0", "0"],
            fingerNumbers: ["", "3", "2", "", "", ""],
            notes: "C major seventh"
        ),
        Chord(
            name: "C7",
            frets: ["x", "3", "2", "3", "1", "0"],
            fingerNumbers: ["", "3", "2", "4", "1", ""],
            notes: "C dominant seventh"
        ),
        Chord(
            name: "G",
            frets: ["3", "2", "0", "0", "0", "3"],
            fingerNumbers: ["2", "1", "", "", "", "3"],
            notes: "G major"
        ),
        Chord(
            name: "G7",
            frets: ["3", "2", "0", "0", "0", "1"],
            fingerNumbers: ["3", "2", "", "", "", "1"],
            notes: "G dominant seventh"
        ),
        Chord(
            name: "D",
            frets: ["x", "x", "0", "2", "3", "2"],
            fingerNumbers: ["", "", "", "1", "3", "2"],
            notes: "D major"
        ),
        Chord(
            name: "Dmaj7",
            frets: ["x", "x", "0", "2", "2", "2"],
            fingerNumbers: ["", "", "", "1", "1", "1"],
            notes: "D major seventh"
        ),
        Chord(
            name: "D7",
            frets: ["x", "x", "0", "2", "1", "2"],
            fingerNumbers: ["", "", "", "2", "1", "3"],
            notes: "D dominant seventh"
        ),
        Chord(
            name: "Dm",
            frets: ["x", "x", "0", "2", "3", "1"],
            fingerNumbers: ["", "", "", "2", "3", "1"],
            notes: "D minor"
        ),
        Chord(
            name: "Dm7",
            frets: ["x", "x", "0", "2", "1", "1"],
            fingerNumbers: ["", "", "", "2", "1", "1"],
            notes: "D minor seventh"
        ),
        Chord(
            name: "Em",
            frets: ["0", "2", "2", "0", "0", "0"],
            fingerNumbers: ["", "2", "3", "", "", ""],
            notes: "E minor"
        ),
        Chord(
            name: "Em7",
            frets: ["0", "2", "0", "0", "0", "0"],
            fingerNumbers: ["", "2", "", "", "", ""],
            notes: "E minor seventh"
        ),
        Chord(
            name: "E",
            frets: ["0", "2", "2", "1", "0", "0"],
            fingerNumbers: ["", "2", "3", "1", "", ""],
            notes: "E major"
        ),
        Chord(
            name: "E7",
            frets: ["0", "2", "0", "1", "0", "0"],
            fingerNumbers: ["", "2", "", "1", "", ""],
            notes: "E dominant seventh"
        ),
        Chord(
            name: "F",
            frets: ["x", "x", "3", "2", "1", "1"],
            fingerNumbers: ["", "", "3", "2", "1", "1"],
            notes: "F major"
        ),
        Chord(
            name: "Fmaj7",
            frets: ["x", "x", "3", "2", "1", "0"],
            fingerNumbers: ["", "", "3", "2", "1", ""],
            notes: "F major seventh"
        )
    ]

    var body: some View {
        if mode == "mastery" {
            ChordMasteryView(title: "Open Chords Mastery", chords: openChords)
                .chordFlashNavigationTitle()
        } else {
            ChordPracticeView(title: "Open Chords Practice", chords: openChords)
                .chordFlashNavigationTitle()
        }
    }
}

#Preview {
    NavigationStack {
        OpenChordView(mode: "practice")
    }
}
