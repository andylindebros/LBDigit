import SwiftUI

public struct Arm: Shape {
    public init(_ direction: Direction) {
        self.direction = direction
    }

    public enum Direction {
        case horizontal, vertical
    }

    private let direction: Direction
    public func path(in rect: CGRect) -> Path {
        switch direction {
        case .horizontal:
            return horizontal(in: rect)
        case .vertical:
            return vertical(in: rect)
        }
    }

    private func horizontal(in rect: CGRect) -> Path {
        Path { path in
            // Upper arrow
            path.move(to: CGPoint(x: 0, y: rect.height / 2))
            path.addLine(to: CGPoint(x: rect.height / 2, y: rect.height))
            path.addLine(to: CGPoint(x: rect.height / 2, y: 0))

            // Rectangle
            path.move(to: CGPoint(x: rect.height / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.height / 2, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width - rect.height / 2, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width - rect.height / 2, y: 0))

            // Bottom arrow
            path.move(to: CGPoint(x: rect.width - rect.height / 2, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
            path.addLine(to: CGPoint(x: rect.width - rect.height / 2, y: 0))
        }
    }

    private func vertical(in rect: CGRect) -> Path {
        Path { path in
            // Upper arrow
            path.move(to: CGPoint(x: rect.width / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.width / 2))
            path.addLine(to: CGPoint(x: 0, y: rect.width / 2))

            // Rectangle
            path.move(to: CGPoint(x: 0, y: rect.width / 2))
            path.addLine(to: CGPoint(x: rect.width, y: rect.width / 2))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - rect.width / 2))
            path.addLine(to: CGPoint(x: 0, y: rect.height - rect.width / 2))

            // Bottom arrow
            path.move(to: CGPoint(x: 0, y: rect.height - rect.width / 2))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - rect.width / 2))
            path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        }
    }
}

struct DigitArm_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                Arm(.vertical)
                    .fill(Color.red)
                    .frame(maxWidth: geo.frame(in: .local).height / 8)
                Arm(.horizontal)
                    .fill(Color.red)
                    .frame(maxHeight: geo.frame(in: .local).height / 8)
                Spacer()
            }
        }
    }
}
