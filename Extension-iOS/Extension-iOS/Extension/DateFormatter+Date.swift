import Foundation

extension DateFormatter {
    private static func appFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = NSLocale.current
        formatter.timeZone = TimeZone(abbreviation: "JST")
        
        return formatter
    }
    
    static func commonDateFormatter() -> DateFormatter {
        let formatter = appFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter
    }
    
    static func commonTimeFormatter() -> DateFormatter {
        let formatter = appFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }
    
    static func commonDateAndTimeFormatter() -> DateFormatter {
        let formatter = appFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        return formatter
    }
    
    static func dateLocalableFormatter() -> DateFormatter {
        let formatter = appFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter
    }
}
