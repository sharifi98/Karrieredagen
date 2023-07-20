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
        VStack(alignment: .leading, spacing: 8) {
            Text(event.name)
                .font(.headline)
                .foregroundColor(.orange)
            Text("\(event.start_time) - \(event.end_time)")
                .font(.subheadline)
                .foregroundColor(.white)
            Text(event.location)
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
    
    // A computed property for the duration label
    var durationLabel: some View {
        HStack(spacing: 4) {
            Image(systemName: "clock")
                .foregroundColor(.white)
            Text("\(event.duration) min")
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

// Extension for row formatting
extension View {
    func formattingRow() -> some View {
        self
            .padding()
            .foregroundColor(.white)
            .background(Color(red: 0.02, green: 0.06, blue: 0.2).opacity(0.5))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 2, y: 2)
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRow(event: events[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
