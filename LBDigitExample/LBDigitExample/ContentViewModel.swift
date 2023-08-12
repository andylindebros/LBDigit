import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published private(set) var time: Date = .now

    private var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.time = Date.now
        }
    }

    var hour: String {
        transformValue(from: Calendar.current.component(.hour, from: time))
    }

    var minute: String {
        transformValue(from: Calendar.current.component(.minute, from: time))
    }

    var second: String {
        transformValue(from: Calendar.current.component(.second, from: time))
    }

    private func transformValue(from value: Int) -> String {
        value < 10 ? "0\(value)" : "\(value)"
    }
}
