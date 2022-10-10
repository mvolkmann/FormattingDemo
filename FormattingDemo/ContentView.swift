import SwiftUI

struct ContentView: View {
    private var currency: String {
        let price = 1234.567
        // let code = "EUR" // Euros
        let code = "USD" // U.S. Dollars
        // This adds currency symbol, placeholder characters (like commas),
        // and rounds the value to two decimal places.
        // It does not perform currency conversion.
        return price.formatted(.currency(code: code))
    }

    private var formattedDate: String {
        let today = Date()
        return today.formatted(.dateTime.month().day().year()) // Oct 10, 2022
    }

    private var daysBetween: String {
        let today = Date()
        let preceding = today.daysBefore(5) // see DateExtension.swift
        let dateRange = preceding ..< today // cannot use ...
        return dateRange.formatted(.components(style: .wide))
    }

    private var personName: String {
        var pnc = PersonNameComponents()
        pnc.givenName = "Richard"
        pnc.middleName = "Mark"
        pnc.familyName = "Volkmann"

        // This applies internationalized name formatting.
        let formatter = PersonNameComponentsFormatter()
        // formatter.style = .abbreviated // first and last initials
        // formatter.style = .short // first
        // formatter.style = .medium // first and last
        // formatter.style = .default // same as .medium
        formatter.style = .long // first, middle, and last
        return formatter.string(from: pnc)
    }

    private var rainfall: String {
        // Unit types include UnitAngle, UnitArea, UnitLength, and UnitVolume.
        let measurement = Measurement(value: 12, unit: UnitLength.millimeters)

        return measurement.formatted(
            // This converts a measurement to locale-appropriate units.
            // usage values include .asProvided, .focalLength, .general,
            // .person, .personHeight, .rainfall, .road, and .snowfall.
            .measurement(width: .narrow, usage: .rainfall) // 0.47"
            // .measurement(width: .wide, usage: .rainfall) // 0.47 inches
        )
    }

    private var timeAgo: String {
        let today = Date()
        let preceding = today
            // These methods are defined in DateExtension.swift.
            // .daysAfter(1)
            // .daysBefore(33)
            .daysBefore(8)
        // .hoursBefore(2)
        // .hoursAfter(2)
        // .minutesBefore(34)

        // presentation can be .numeric or .named.
        //
        // .numeric produces values like
        // "3 weeks ago", "3 hours ago", "3 minutes ago",
        // or "in 3 hours"
        //
        // .named produces values like
        // "last month", "last week", "yesterday", or "tomorrow"
        //
        // This only reports hours if one hour or more (rounds to closest)
        // and only reports minutes if less than one hour.
        // unitsStyle can be .abbreviated (1 wk. ago), .narrow (1 wk. ago),
        // .spellOut (one week ago), or .wide (1 week ago).
        let text = preceding.formatted(
            .relative(presentation: .numeric, unitsStyle: .abbreviated)
        )
        return text
    }

    private var timeBetween: String {
        let today = Date()
        let preceding = today
            .hoursBefore(2)
            .minutesBefore(19) // see DateExtension.swift
        let dateRange = preceding ..< today // cannot use ...
        return dateRange.formatted(.components(style: .wide))
    }

    var body: some View {
        VStack {
            Text(formattedDate)
            Text(daysBetween)
            Text(timeBetween)
            Text(timeAgo)
            Text(personName)
            Text(currency)
            Text(rainfall)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
