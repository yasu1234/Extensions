import Foundation

extension Dictionary {
    func getKeyValues() {
        for (key, value) in self {
            print("\(key)" + "and" + "\(value)")
        }
    }
}
