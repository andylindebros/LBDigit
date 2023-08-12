import Foundation
import SwiftUI

public struct Digit: View {
    public init(
        value: Int? = nil,
        thickness: CGFloat = 10,
        distance: CGFloat = 2,
        color: Color = .gray,
        highligtedColor: Color = .red,
        applyHighlightedShaddow: Bool = true
    ) {
        self.thickness = thickness
        self.distance = distance
        self.value = value ?? 12
        self.color = color
        self.highligtedColor = highligtedColor
        self.applyHighlightedShaddow = applyHighlightedShaddow
    }

    private let thickness: CGFloat
    private let distance: CGFloat
    private let value: Int
    private let color: Color
    private let highligtedColor: Color
    private let applyHighlightedShaddow: Bool

    private let mapping: [[Int]] = [
        // zero
        [1, 2, 3, 5, 6, 7],
        // one
        [6, 7],
        // two
        [2, 3, 4, 5, 6],
        // three
        [3, 4, 5, 6, 7],
        // four
        [1, 4, 6, 7],
        // five
        [1, 3, 4, 5, 7],
        // six
        [1, 2, 3, 4, 5, 7],
        // seven
        [3, 6, 7],
        // eight
        [1, 2, 3, 4, 5, 6, 7],
        // nine
        [1, 3, 4, 6, 7],
        // ten: minus
        [4],
        // 11: error
        [1, 2, 3, 4, 5],
        // 12: disabled
        [],
    ]

    private func isHighlighted(arm: Int) -> Bool {
        guard mapping.count > value else { return false }
        return mapping[value].contains(arm)
    }

    public var body: some View {
        ZStack {
            GeometryReader { geo in
                // 1, TopLeft
                Arm(.vertical)
                    .fill(isHighlighted(arm: 1) ? highligtedColor : color)
                    .frame(
                        width: thickness,
                        height: geo.frame(in: .local).height / 2 - thickness / 2 - distance * 2
                    )
                    .offset(
                        y: thickness / 2 + distance
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 1)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }

                // 2, BottomLeft
                Arm(.vertical)
                    .fill(isHighlighted(arm: 2) ? highligtedColor : color)
                    .frame(
                        width: thickness,
                        height: geo.frame(in: .local).height / 2 - thickness / 2 - distance * 2
                    )
                    .offset(
                        y: geo.frame(in: .local).height / 2 + distance
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 2)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }

                // 3, TopMid
                Arm(.horizontal)
                    .fill(isHighlighted(arm: 3) ? highligtedColor : color)
                    .frame(
                        width: geo.frame(in: .local).width - thickness - distance * 2,
                        height: thickness
                    )
                    .offset(
                        x: thickness / 2 + distance
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 3)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }

                // 4, MidMid
                Arm(.horizontal)
                    .fill(isHighlighted(arm: 4) ? highligtedColor : color)
                    .frame(
                        width: geo.frame(in: .local).width - thickness - distance * 2,
                        height: thickness
                    )
                    .offset(
                        x: thickness / 2 + distance,
                        y: geo.frame(in: .local).height / 2 - thickness / 2
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 4)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }

                // 5, BottomMid
                Arm(.horizontal)
                    .fill(isHighlighted(arm: 5) ? highligtedColor : color)
                    .frame(
                        width: geo.frame(in: .local).width - thickness - distance * 2,
                        height: thickness
                    )
                    .offset(
                        x: thickness / 2 + distance,
                        y: geo.frame(in: .local).height - thickness
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 5)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }

                // 6, TopRight
                Arm(.vertical)
                    .fill(isHighlighted(arm: 6) ? highligtedColor : color)
                    .frame(
                        width: thickness,
                        height: geo.frame(in: .local).height / 2 - thickness / 2 - distance * 2
                    )
                    .offset(
                        x: geo.frame(in: .local).width - thickness,
                        y: thickness / 2 + distance
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 6)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }

                // 7, BottomRight
                Arm(.vertical)
                    .fill(isHighlighted(arm: 7) ? highligtedColor : color)
                    .frame(
                        width: thickness,
                        height: geo.frame(in: .local).height / 2 - thickness / 2 - distance * 2
                    )
                    .offset(
                        x: geo.frame(in: .local).width - thickness,
                        y: geo.frame(in: .local).height / 2 + distance
                    )
                    .if(applyHighlightedShaddow && isHighlighted(arm: 7)) { view in
                        view.shadow(color: highligtedColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    }
            }
        }
    }
}

private extension View {
    func armWidth(from geo: GeometryProxy) -> some View {
        frame(width: geo.frame(in: .local).width / 10)
    }
}

struct Digit_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Digit(
                        value: 5,
                        thickness: 30,
                        distance: 4,
                        color: .gray.opacity(0.1)
                    ).frame(
                        width: geo.frame(in: .local).width / 2,
                        height: geo.frame(in: .local).height / 2
                    )

                    Spacer()
                }
                Spacer()
            }
        }
        .padding()
    }
}
