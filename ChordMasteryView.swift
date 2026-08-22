//
//  ChordMasteryView.swift
//  ChordFlash
//
//  Created by Myron Snelson on 8/22/26.
//

import SwiftUI


struct ChordMasteryView: View {
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
                    
                    Button("Next Test Chord", systemImage: "shuffle") {
                        showRandomChord()
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
    ChordMasteryView(
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
