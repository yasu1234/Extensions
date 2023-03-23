import Foundation

extension Array where Element: Equatable {
    // get index when conrtains element
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}
