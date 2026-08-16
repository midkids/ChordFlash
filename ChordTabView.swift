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

            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
                    Text("String")
                        .frame(width: 77, alignment: .leading)

                    Text("Fret")
                        .frame(width: 60, alignment: .leading)

                    Text("Finger")
                        .frame(width: 84, alignment: .leading)

                    Text("Note Played")
                        .frame(width: 48, alignment: .leading)
                }
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.secondary)

                ForEach(Array(zip(strings, zip(chord.fingering, zip(chord.stringNotes, chord.fingerNumbers)))), id: \.0) { stringName, chordInfo in
                    let fret = chordInfo.0
                    let note = chordInfo.1.0
                    let finger = chordInfo.1.1

                    HStack(spacing: 10) {
                        Text(stringName)
                            .font(.headline.monospaced())
                            .frame(width: 42, alignment: .leading)

                        Text("|--\(fret)--|")
                            .font(.title2.monospaced())

                        Text(finger.isEmpty ? "" : "finger \(finger)")
                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .frame(minWidth: 110, alignment: .leading)

                        Text(note)
                            .font(.headline.weight(.semibold))
                            .lineLimit(1)
                            .frame(width: 32, alignment: .leading)
                    }
                }
            }
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
            name: "A",
            fingering: ["x", "0", "2", "2", "2", "0"],
            fingerNumbers: ["", "", "2", "1", "3", ""],
            notes: "A major"
        )
    )
}
