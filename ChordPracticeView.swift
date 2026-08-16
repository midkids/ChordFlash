//
//  ChordPracticeView.swift
//  ChordFlash
//

import SwiftUI

struct Chord: Identifiable {
    let id = UUID()
    let name: String
    let fingering: [String]
    let fingerNumbers: [String]
    let notes: String
    let stringNotes: [String]

    init(name: String, fingering: [String], fingerNumbers: [String], notes: String) {
        self.name = name
        self.fingering = fingering
        self.fingerNumbers = fingerNumbers
        self.notes = notes
        self.stringNotes = Chord.notesForFingering(fingering)
    }

    private static let openStringOffsets: [Int] = [4, 9, 2, 7, 11, 4]
    private static let noteNames: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

    private static func notesForFingering(_ fingering: [String]) -> [String] {
        var notes: [String] = []

        for index in fingering.indices {
            guard index < openStringOffsets.count,
                  let fretNumber = Int(fingering[index]) else {
                notes.append("")
                continue
            }

            let noteIndex = (openStringOffsets[index] + fretNumber) % noteNames.count
            notes.append(noteNames[noteIndex])
        }

        return notes
    }
}

struct ChordPracticeView: View {
    let title: String
    let chords: [Chord]

    @State private var currentChordIndex = 0
    @State private var isShowingAnswer = false

    private var currentChord: Chord {
        chords[currentChordIndex]
    }

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Text(title)
                        .font(.largeTitle.bold())

                    Text("Tap the card to flip it")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        isShowingAnswer.toggle()
                    }
                } label: {
                    FlashCardView(chord: currentChord, isShowingAnswer: isShowingAnswer)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(isShowingAnswer ? "Showing tab for \(currentChord.name)" : "Showing chord \(currentChord.name)")
                .accessibilityHint("Double tap to flip the card")

                HStack(spacing: 8) {
                    Button("Previous", systemImage: "chevron.left") {
                        showPreviousChord()
                    }

                    Button("Shuffle", systemImage: "shuffle") {
                        showRandomChord()
                    }

                    Button("Next", systemImage: "chevron.right") {
                        showNextChord()
                    }
                }
                .font(.caption.weight(.semibold))
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .buttonStyle(.borderedProminent)
                .controlSize(.small)

                Text("Card \(currentChordIndex + 1) of \(chords.count)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
    }

    private func showPreviousChord() {
        currentChordIndex = currentChordIndex == 0 ? chords.count - 1 : currentChordIndex - 1
        isShowingAnswer = false
    }

    private func showNextChord() {
        currentChordIndex = currentChordIndex == chords.count - 1 ? 0 : currentChordIndex + 1
        isShowingAnswer = false
    }

    private func showRandomChord() {
        guard chords.count > 1 else { return }

        var newIndex = currentChordIndex
        while newIndex == currentChordIndex {
            newIndex = Int.random(in: chords.indices)
        }

        currentChordIndex = newIndex
        isShowingAnswer = false
    }
}


#Preview {
    ChordPracticeView(
        title: "Preview",
        chords: [
            Chord(
                name: "A",
                fingering: ["x", "0", "2", "2", "2", "0"],
                fingerNumbers: ["", "", "2", "1", "3", ""],
                notes: "A major"
            )
        ]
    )
}
