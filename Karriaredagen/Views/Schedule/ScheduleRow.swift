//
//  ScheduleRow.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct ScheduleRow: View {
    var event: Event
    var colors: [Color] = [.gray, .orange]

    var body: some View {
        HStack {
            eventDetails
            Spacer()
            durationLabel
        }
        .formattingRow()
    }
    
    // A computed property for the event details
    var eventDetails: some View {
        VStack(alignment: .leading) {
            Text(event.name)
                .font(.title3)
                .foregroundColor(.orange)
            Text("\(event.start_time) - \(event.end_time)")
                .font(.subheadline)
            Text("\(event.location)")
                .font(.subheadline)
        }
    }
    
    // A computed property for the duration label
    var durationLabel: some View {
        Label("\(event.duration) min", systemImage: "clock")
    }
}

// Extension for row formatting
extension View {
    func formattingRow() -> some View {
        self
            .padding(20)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            //.background(Color(red: 0.02, green: 0.06, blue: 0.2))
            .background(Color(.blue))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.6), radius: 7, x: 10, y: 10)
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRow(event: events[0])
    }
}
