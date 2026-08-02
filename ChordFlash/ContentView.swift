//
//  ContentView.swift
//  ChordFlash
//
//  Created by Myron Snelson on 8/2/26.
//

import SwiftUI

struct Chord: Identifiable {
    let id = UUID()
    let name: String
    let fingering: [String]
    let fingerNumbers: [String]
    let notes: String
}

struct ContentView: View {
    private let chords = [
        Chord(
            name: "Am7",
            fingering: ["x", "0", "2", "0", "1", "0"],
            fingerNumbers: ["", "", "2", "", "1", ""],
            notes: "A minor seventh"
        ),
        Chord(
            name: "A",
            fingering: ["x", "0", "2", "2", "2", "0"],
            fingerNumbers: ["", "", "1", "2", "3", ""],
            notes: "A major"
        ),
        Chord(
            name: "Amaj7",
            fingering: ["x", "0", "2", "1", "2", "0"],
            fingerNumbers: ["", "", "2", "1", "3", ""],
            notes: "A major seventh"
        ),
        Chord(
            name: "A7",
            fingering: ["x", "0", "2", "0", "2", "0"],
            fingerNumbers: ["", "", "2", "", "3", ""],
            notes: "A dominant seventh"
        ),
        Chord(
            name: "Am",
            fingering: ["x", "0", "2", "2", "1", "0"],
            fingerNumbers: ["", "", "2", "3", "1", ""],
            notes: "A minor"
        ),
        Chord(
            name: "B7",
            fingering: ["x", "2", "1", "2", "0", "2"],
            fingerNumbers: ["", "2", "1", "3", "", "4"],
            notes: "B dominant seventh"
        ),
        Chord(
            name: "C",
            fingering: ["x", "3", "2", "0", "1", "0"],
            fingerNumbers: ["", "3", "2", "", "1", ""],
            notes: "C major"
        ),
        Chord(
            name: "Cmaj7",
            fingering: ["x", "3", "2", "0", "0", "0"],
            fingerNumbers: ["", "3", "2", "", "", ""],
            notes: "C major seventh"
        ),
        Chord(
            name: "C7",
            fingering: ["x", "3", "2", "3", "1", "0"],
            fingerNumbers: ["", "3", "2", "4", "1", ""],
            notes: "C dominant seventh"
        ),
        Chord(
            name: "G",
            fingering: ["3", "2", "0", "0", "0", "3"],
            fingerNumbers: ["2", "1", "", "", "", "3"],
            notes: "G major"
        ),
        Chord(
            name: "G7",
            fingering: ["3", "2", "0", "0", "0", "1"],
            fingerNumbers: ["3", "2", "", "", "", "1"],
            notes: "G dominant seventh"
        ),
        Chord(
            name: "D",
            fingering: ["x", "x", "0", "2", "3", "2"],
            fingerNumbers: ["", "", "", "1", "3", "2"],
            notes: "D major"
        ),
        Chord(
            name: "Dmaj7",
            fingering: ["x", "x", "0", "2", "2", "2"],
            fingerNumbers: ["", "", "", "1", "1", "1"],
            notes: "D major seventh"
        ),
        Chord(
            name: "D7",
            fingering: ["x", "x", "0", "2", "1", "2"],
            fingerNumbers: ["", "", "", "2", "1", "3"],
            notes: "D dominant seventh"
        ),
        Chord(
            name: "Dm",
            fingering: ["x", "x", "0", "2", "3", "1"],
            fingerNumbers: ["", "", "", "2", "3", "1"],
            notes: "D minor"
        ),
        Chord(
            name: "Dm7",
            fingering: ["x", "x", "0", "2", "1", "1"],
            fingerNumbers: ["", "", "", "2", "1", "1"],
            notes: "D minor seventh"
        ),
        Chord(
            name: "Em",
            fingering: ["0", "2", "2", "0", "0", "0"],
            fingerNumbers: ["", "2", "3", "", "", ""],
            notes: "E minor"
        ),
        Chord(
            name: "Em7",
            fingering: ["0", "2", "0", "0", "0", "0"],
            fingerNumbers: ["", "2", "", "", "", ""],
            notes: "E minor seventh"
        ),
        Chord(
            name: "E",
            fingering: ["0", "2", "2", "1", "0", "0"],
            fingerNumbers: ["", "2", "3", "1", "", ""],
            notes: "E major"
        ),
        Chord(
            name: "E7",
            fingering: ["0", "2", "0", "1", "0", "0"],
            fingerNumbers: ["", "2", "", "1", "", ""],
            notes: "E dominant seventh"
        ),
        Chord(
            name: "F",
            fingering: ["x", "x", "3", "2", "1", "1"],
            fingerNumbers: ["", "", "3", "2", "1", "1"],
            notes: "F major"
        ),
        Chord(
            name: "Fmaj7",
            fingering: ["x", "x", "3", "2", "1", "0"],
            fingerNumbers: ["", "", "3", "2", "1", ""],
            notes: "F major seventh"
        )
    ]

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
                    Text("ChordFlash")
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
                    FlashCard(chord: currentChord, isShowingAnswer: isShowingAnswer)
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

struct FlashCard: View {
    let chord: Chord
    let isShowingAnswer: Bool

    var body: some View {
        VStack(spacing: 22) {
            if isShowingAnswer {
                ChordTabView(chord: chord)
            } else {
                VStack(spacing: 16) {
                    Text(chord.name)
                        .font(.system(size: 84, weight: .bold, design: .rounded))
                        .minimumScaleFactor(0.6)

                    Text(chord.notes)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        .padding(24)
        .frame(maxWidth: 420)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .shadow(color: .black.opacity(0.16), radius: 18, x: 0, y: 10)
    }
}

struct ChordTabView: View {
    let chord: Chord

    private let strings = ["E", "A", "D", "G", "B", "e"]

    var body: some View {
        VStack(spacing: 18) {
            Text(chord.name)
                .font(.largeTitle.bold())

            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(zip(strings, zip(chord.fingering, chord.fingerNumbers))), id: \.0) { stringName, chordInfo in
                    let fret = chordInfo.0
                    let finger = chordInfo.1

                    HStack(spacing: 12) {
                        Text(stringName)
                            .font(.headline.monospaced())
                            .frame(width: 24, alignment: .leading)

                        Text("|--\(fret)--|")
                            .font(.title2.monospaced())

                        Text(finger.isEmpty ? "" : "finger \(finger)")
                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .frame(minWidth: 88, alignment: .leading)
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
    ContentView()
}
