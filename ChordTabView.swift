//
//  ChordTabView.swift
//  ChordFlash
//

import SwiftUI

struct ChordTabView: View {
    let chord: Chord

    private let strings = ["E", "A", "D", "G", "B", "e"]

    var body: some View {
        VStack(spacing: 18) {
            Text(chord.name)
                .font(.largeTitle.bold())

            Grid(alignment: .center, horizontalSpacing: 10, verticalSpacing: 8) {
                GridRow {
                    Text("String")
                        .gridColumnAlignment(.center)
                    Text("Fret")
                        .gridColumnAlignment(.center)
                    Text("Finger")
                        .gridColumnAlignment(.center)
                    Text("Note")
                        .gridColumnAlignment(.center)
                }
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.secondary)

                ForEach(Array(zip(strings, zip(chord.frets, zip(chord.stringNotes, chord.fingerNumbers)))), id: \.0) { stringName, chordInfo in
                    let fret = chordInfo.0
                    let note = chordInfo.1.0
                    let finger = chordInfo.1.1

                    GridRow {
                        Text(stringName)
                            .font(.headline.monospaced())

                        Text("|--\(fret)--|")
                            .font(.title2.monospaced())

                        Text(finger)
                            .font(.headline)
                            .lineLimit(1)

                        Text(note)
                            .font(.headline.weight(.semibold))
                            .lineLimit(1)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)

            Text("low E to high e")
                .font(.footnote)
                .foregroundStyle(.secondary)

            Text("1 index  2 middle  3 ring  4 pinky")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ChordTabView(
        chord: Chord(
            type: .open,
            name: "A",
            frets: ["x", "0", "2", "2", "2", "0"],
            fingerNumbers: ["", "", "2", "1", "3", ""],
            notes: "A major"
        )
    )
}
