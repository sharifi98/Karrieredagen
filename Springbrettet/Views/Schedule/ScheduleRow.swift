import SwiftUI

struct ScheduleRow: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(event.name)
                .font(.kdHeading(20))
                .foregroundColor(.kdOrange)

            HStack {
                Text("\(event.start_time) - \(event.end_time)")
                Spacer()
                Text(event.location)
            }
            .font(.kdBody(16))
            .foregroundColor(.kdSecondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.kdBackground.opacity(0.6))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct ScheduleRow_Previews: PreviewProvider {

    static var previews: some View {

        ScheduleRow(event: events[3])

            .previewLayout(.sizeThatFits)

            .padding()

            .background(Color.black)

    }

}
