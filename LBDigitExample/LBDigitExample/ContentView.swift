import LBDigit
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @Environment(\.colorScheme) var colorScheme

    let thickness: CGFloat = 10
    let distance: CGFloat = 1

    var color: Color {
        colorScheme == .dark ? .white.opacity(0.1) : .gray.opacity(0.1)
    }

    var highlightedColor: Color {
        colorScheme == .dark ? .white : .black
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    digits(for: viewModel.hour, in: geo.frame(in: .local))
                    dots(in: geo.frame(in: .local))
                    digits(for: viewModel.minute, in: geo.frame(in: .local))
                    dots(in: geo.frame(in: .local))
                    digits(for: viewModel.second, in: geo.frame(in: .local))
                }
                .frame(height: geo.frame(in: .local).width * 0.25)
                .padding()
                Spacer()
            }
        }
    }

    func dots(in frame: CGRect) -> some View {
        VStack(spacing: frame.width * 0.04) {
            Spacer()
            Rectangle()
                .frame(width: frame.width * 0.02, height: frame.width * 0.02)
                .shadow(color: color.opacity(0.7), radius: 5, x: 0, y: 0)

            Rectangle()
                .frame(width: frame.width * 0.02, height: frame.width * 0.02)
                .shadow(color: color.opacity(0.7), radius: 5, x: 0, y: 0)

            Spacer()
        }
    }

    @ViewBuilder func digits(for value: String, in frame: CGRect) -> some View {
        Digit(
            value: Int(value.prefix(1)) ?? 11,
            thickness: frame.width * 0.02,
            distance: distance,
            color: color,
            highligtedColor: highlightedColor
        )
        Digit(
            value: Int(value[1]) ?? 11,
            thickness: frame.width * 0.02,
            distance: distance,
            color: color,
            highligtedColor: highlightedColor
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
