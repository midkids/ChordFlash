//
//  FlashCardView.swift
//  ChordFlash
//

import SwiftUI

struct FlashCardView: View {
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

#Preview {
    FlashCardView(
        chord: Chord(
            name: "A",
            fingering: ["x", "0", "2", "2", "2", "0"],
            fingerNumbers: ["", "", "2", "1", "3", ""],
            notes: "A major"
        ),
        isShowingAnswer: false
    )
}
