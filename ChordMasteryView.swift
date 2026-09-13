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

    @State private var currentChordIndex: Int
    @State private var isShowingAnswer = false
    @State private var masteredChordIndices = Set<Int>()
    
    // IMPORTANT: Because we are not setting a default
    // value for currentChordIndex, we must create a
    // custom initializer.
    
    // This logic will cause the ChordMasteryView to
    // display the initial chord randomly.
    
    // IMPORTANT: Because currentChordIndex is an @State property,
    // SwiftUI manages it after the view is created.
    // To set an initial value for an @State property
    // inside an initializer, you assign to the
    // backing storage using the underscore form.
    init(title: String, chords: [Chord]) {
        self.title = title
        self.chords = chords
        _currentChordIndex = State(initialValue: chords.indices.randomElement() ?? 0)
    }

    private var currentChord: Chord {
        chords[currentChordIndex]
    }

    private var availableChordIndices: [Int] {
        chords.indices.filter { !masteredChordIndices.contains($0) }
    }

    private var hasMasteredAllChords: Bool {
        !chords.isEmpty && masteredChordIndices.count == chords.count
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

                if hasMasteredAllChords {
                    Text("You've gotten all available chords!")
                        .font(.title3.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                } else {
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
                    
                    VStack(spacing: 8) {

                        VStack(spacing: 6) {
                            Text("Toggle the switch if you have mastered this chord")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("Got it!")

                            Toggle(
                                "Got it!",
                                isOn: Binding(
                                    get: { masteredChordIndices.contains(currentChordIndex) },
                                    set: { isOn in
                                        if isOn {
                                            markCurrentChordAsMastered()
                                        }
                                    }
                                )
                            )
                            .labelsHidden()
                            .toggleStyle(.switch)
                        }
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
            }
            .padding()
        }
    }

    private func showRandomChord() {
        let randomOptions = availableChordIndices.filter { $0 != currentChordIndex }
        let fallbackOptions = availableChordIndices

        guard let newIndex = (randomOptions.isEmpty ? fallbackOptions : randomOptions).randomElement() else { return }

        currentChordIndex = newIndex
        isShowingAnswer = false
    }

    private func markCurrentChordAsMastered() {
        masteredChordIndices.insert(currentChordIndex)
    }
}


#Preview {
    ChordMasteryView(
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
