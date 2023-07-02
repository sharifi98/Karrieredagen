import SwiftUI

struct ScheduleList: View {
    @State private var selectedEvent: Event?

    var body: some View {
        NavigationView {
            ZStack {
                Image("marinebackground")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(events) { event in
                            eventRow(for: event)
                        }
                    }
                    .padding(.horizontal)
                }
                .sheet(item: $selectedEvent) { eventDetail in
                    EventDetailView(event: eventDetail)
                }
                .navigationBarWithOrangeBackground()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Timeplan")
                            .font(.system(size: 36, weight: .semibold))
                            .foregroundColor(.orange)
                    }
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func eventRow(for event: Event) -> some View {
        Button(action: {
            selectedEvent = event
        }) {
            ScheduleRow(event: event)
        }
        .foregroundColor(.white)
    }
}



struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
