import SwiftUI
import PeakerKernel

struct SpeedChip: View {
    @Binding var speed: PresentationSpeed

    var body: some View {
        Menu {
            ForEach(PresentationSpeed.allCases, id: \.self) { item in
                Button(item.label) { speed = item }
            }
        } label: {
            Label(speed.label, systemImage: "speedometer")
                .font(.caption.weight(.semibold))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .overlay(
                    Capsule().stroke(Color.secondary, lineWidth: 1)
                )
        }
        .accessibilityLabel("Speed \(speed.label). Display only. Does not advance simulation time.")
    }
}
