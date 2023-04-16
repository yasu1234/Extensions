import UIKit

extension UILabel {
    // if return ture, this is omitted
    var isOverflowing: Bool {
        return (realLineCount() > self.numberOfLines)
    }

    // calculate the number of lines when the full text is drawn without omission
    private func realLineCount()-> Int {
        guard let font = self.font else { return 0 }
        guard let text = self.text, text != "" else { return 0 }
        let sizeForWidthCheck = CGSize(width: Int.max, height: Int(ceil(font.pointSize)))

        let oneLineWidth = text.boundingRect(
            with: sizeForWidthCheck,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        ).width
        let boundingWidth = text.boundingRect(
            with: self.bounds.size,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        ).width
        
        // return rect of text drawn. To use it, calculates the width of the entire drawing in one line.
        return Int(ceil(oneLineWidth / boundingWidth))
    }
}
