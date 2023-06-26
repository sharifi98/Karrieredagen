import SwiftUI

struct ScheduleList: View {
    @State private var selectedEvent: Event?

    var body: some View {
        NavigationView {
            ZStack {
                backgroundImage
                ScrollView {
                    eventList
                }
                .sheet(item: $selectedEvent) { eventDetail in
                    EventDetailView(event: eventDetail)
                }
                .navigationBarWithOrangeBackground()
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Text("Timeplan")
                            .font(.system(size: 36, weight: .semibold))
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
    
    var backgroundImage: some View {
        Image("marinebackground")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
    
    var eventList: some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()
            ForEach(events) { event in
                eventRow(for: event)
            }
        }
        .padding(.horizontal)
    }
    
    func eventRow(for event: Event) -> some View {
        Button(action: {
            selectedEvent = event
        }) {
            ScheduleRow(event: event)
        }
    }
}

struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
