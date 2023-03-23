import Foundation

extension Date {
    func getDay() {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        print(year, month, day, hour, minute, second)

        // gather above data(month, hour...)
        let comps = calendar.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: self
        )
        print(comps.year!, comps.month!, comps.day!, comps.hour!, comps.minute!, comps.second!)
    }
    
    func editDate() -> (Date?,Date?) {
        let calendar = Calendar.current

        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: self))
        let yesterday = calendar.date(byAdding: .day, value: -1, to: calendar.startOfDay(for: self))
        
        return (tomorrow, yesterday)
    }
    
    func getLastDayOfMonth() -> Date? {
        let calendar = Calendar.current

        // fistDay of Month
        let comps = calendar.dateComponents([.year, .month], from: self)
        let firstday = calendar.date(from: comps)

        let add = DateComponents(month: 1, day: -1)
        let lastday = calendar.date(byAdding: add, to: firstday!)
        
        return lastday
    }
    
    func compareDate(_ date: Date) {
        print(self == date)
        
        let calendar = Calendar.current
        // check month and year and day are equal
        print(calendar.isDate(self, inSameDayAs: date))
        
        // check year is equal
        print(calendar.compare(self, to: date, toGranularity: .year) == .orderedSame)
        
        // check month and year and hour are equal
        let dateComp = calendar.dateComponents([.year, .month, .hour], from: self)
        print(calendar.date(date, matchesComponents: dateComp))
    }
    
    func generateDates(addbyUnit:Calendar.Component, value : Int) -> [Date] {
        var dates = [Date]()
        var date = self
        let endDate = Calendar.current.date(byAdding: addbyUnit, value: value, to: date)!
        while date < endDate {
            date = Calendar.current.date(byAdding: addbyUnit, value: 1, to: date)!
            dates.append(date)
        }
        return dates
    }
    
    // Note: changing Calendar.firstWeekday or Calendar.minimumDaysInFirstWeek breaks commonly week define
    func getWeekNumber() -> Int {
        var calendar = Calendar(identifier: .gregorian)
        // first day is Sunday
        calendar.firstWeekday = 1
        let day = calendar.dateComponents([.weekOfMonth], from: self)
        
        // last week number in current month
        let lastWeekOfMonth = calendar.range(of: .weekOfMonth, in: .month, for: self)
        
        if let weekNumber = day.weekOfMonth {
            return weekNumber
        }
        
        return 1
    }
    
    func getDaysInTargetWeek() {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: self)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: self)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: self) }

        print(days)
    }
    
    func getDayCountInMonth() {
        let calendar = Calendar.current
        calendar.range(of: .day, in: .month, for: self)?.count
    }
    
    func getDaysInWeek() {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        
        let dayOfWeek = calendar.component(.weekday, from: self)
        
        // last week number in current month
        let weekDays = calendar.range(of: .weekday, in: .weekOfYear, for: self)!
        
        let days = (weekDays.lowerBound ..< weekDays.upperBound)
            .compactMap {
                calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: self)
        }
    }
}
