//
//  ChordPracticeView.swift
//  ChordFlash
//

import SwiftUI


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
            Color.chordFlashBackground
                .ignoresSafeArea()

            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Text(title)
                        .font(.title)
                        .foregroundStyle(Color.chordFlashSecondary)

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

                    Button("Random", systemImage: "shuffle") {
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
                type: .open,
                name: "A",
                frets: ["x", "0", "2", "2", "2", "0"],
                fingerNumbers: ["", "", "2", "1", "3", ""],
                notes: "A major"
            )
        ]
    )
}
