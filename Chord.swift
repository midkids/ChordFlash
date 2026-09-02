//
//  Chord.swift
//  ChordFlash
//

import Foundation

struct Chord: Identifiable {
    let id = UUID()
    let name: String
    let frets: [String]
    let fingerNumbers: [String]
    let notes: String
    let stringNotes: [String]

    init(name: String, frets: [String], fingerNumbers: [String], notes: String) {
        self.name = name
        self.frets = frets
        self.fingerNumbers = fingerNumbers
        self.notes = notes
        self.stringNotes = Chord.notesForFingering(frets)
    }

    private static let openStringOffsets: [Int] = [4, 9, 2, 7, 11, 4]
    private static let noteNames: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

    private static func notesForFingering(_ frets: [String]) -> [String] {
        var notes: [String] = []

        for index in frets.indices {
            guard index < openStringOffsets.count,
                  let fretNumber = Int(frets[index]) else {
                notes.append("")
                continue
            }

            let noteIndex = (openStringOffsets[index] + fretNumber) % noteNames.count
            notes.append(noteNames[noteIndex])
        }

        return notes
    }
}
