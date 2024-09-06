import SwiftUI

struct ScheduleList: View {
    @State private var selectedEvent: Event?

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSB()
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(events) { event in
                            eventRow(for: event)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 90)
                }
                .overlay(Rectangle().foregroundColor(.clear))
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Timeplan")
                        .font(.kdHeading(36))
                        .foregroundColor(.kdOrange)
                }
            }
        }
        .sheet(item: $selectedEvent) { event in
            EventDetailView(event: event)
        }
    }

    func eventRow(for event: Event) -> some View {
        Button(action: {
            selectedEvent = event
        }) {
            ScheduleRow(event: event)
        }
        .buttonStyle(PlainButtonStyle())
    }
}



struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
