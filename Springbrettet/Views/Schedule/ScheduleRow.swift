import SwiftUI

struct ScheduleRow: View {

    var event: Event


    var body: some View {

        HStack(spacing: 16) {

            VStack(alignment: .leading) {

                Text(event.name)

                    .font(.title2)

                    .fontWeight(.bold)

                    .foregroundColor(Color("KDOrange"))

                Text("\(event.start_time) - \(event.end_time)")

                    .font(.subheadline)

                    .foregroundColor(.white)

                Text(event.location)

                    .font(.subheadline)

                    .foregroundColor(.white)

            }

            Spacer()

            HStack(spacing: 4) {

                Image(systemName: "clock")

                    .foregroundColor(.white)

                Text("\(event.duration) min")

                    .font(.subheadline)

                    .foregroundColor(.white)

            }

        }

        .padding(16)

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

            .background(Color.black)

    }

}
