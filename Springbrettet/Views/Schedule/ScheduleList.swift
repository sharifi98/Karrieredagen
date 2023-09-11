import SwiftUI

struct ScheduleList: View {
    @State private var selectedEvent: Event?

    var body: some View {
        NavigationView {
            
            ZStack {
                Background()
                ScrollView {
                        
                        VStack(spacing: 10) {
                            ForEach(events) { event in
                                eventRow(for: event)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: 90)

                    }
                    .overlay(Rectangle().foregroundColor(.clear))
                    .sheet(item: $selectedEvent) { eventDetail in
                        EventDetailView(event: eventDetail)
                            .presentationDetents([.medium, .large])
                    }
                    .navigationBarWithTransparentBackground()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Timeplan")
                                .font(.custom("AvenirNext-Bold", size: 36))
                                .foregroundColor(Color("KDOrange"))
                                .padding(.bottom, 30)
                        }
                    }
                .padding()
            }
        }
    }
    
    func eventRow(for event: Event) -> some View {
        Button(action: {
            selectedEvent = event
        }) {
            ScheduleRow(event: event)
        }
        .foregroundColor(Color("KDOrange"))
    }
}



struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
