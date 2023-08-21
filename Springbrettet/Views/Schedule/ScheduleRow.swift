import SwiftUI

struct ScheduleRow: View {

    var event: Event


    var body: some View {

        HStack(spacing: 16) {

            VStack(alignment: .center) {

                Text(event.name)
                    .font(.title2)

                    .fontWeight(.bold)
                    .foregroundColor(Color("KDOrange"))
                Text("\(event.start_time) - \(event.end_time)")
                    .font(.subheadline)
                    .foregroundColor(.white)

                Text(event.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

            }



        }

        .padding(16)
        .frame(minWidth: 350, minHeight: 100)
        .foregroundColor(.white)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 2, y: 2)

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
