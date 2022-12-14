import Foundation

extension Date {
    func daysAfter(_ days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(
            byAdding: .day,
            value: days,
            to: self
        )!
    }

    func daysBefore(_ days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(
            byAdding: .day,
            value: -days,
            to: self
        )!
    }

    func hoursAfter(_ hours: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(
            byAdding: .hour,
            value: hours,
            to: self
        )!
    }

    func hoursBefore(_ hours: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(
            byAdding: .hour,
            value: -hours,
            to: self
        )!
    }

    func minutesAfter(_ minutes: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(
            byAdding: .minute,
            value: minutes,
            to: self
        )!
    }

    func minutesBefore(_ minutes: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(
            byAdding: .minute,
            value: -minutes,
            to: self
        )!
    }
}
