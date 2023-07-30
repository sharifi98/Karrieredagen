import SwiftUI

struct ScheduleRow: View {
    var event: Event

    var body: some View {
        HStack {
            eventDetails
            Spacer()
            durationLabel
        }
        .formattingRow()
        .frame(maxWidth: .infinity) // Add this line
    }
    
    var eventDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(event.name)
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(Color("KDOrange"))
            Text("\(event.start_time) - \(event.end_time)")
                .font(.custom("AvenirNext-Regular", size: 18))
                .foregroundColor(.white)
            Text(event.location)
                .font(.custom("AvenirNext-Regular", size: 18))
                //.foregroundColor(Color("KDOrange"))
                .foregroundColor(.white)
        }
    }
    
    var durationLabel: some View {
        HStack(spacing: 4) {
            Image(systemName: "clock")
                .foregroundColor(.white)
            Text("\(event.duration) min")
                .font(.custom("AvenirNext-Regular", size: 18))
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
            .background(Color(.systemGray6))
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

