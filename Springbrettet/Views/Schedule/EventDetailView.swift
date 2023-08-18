import SwiftUI
import EventKit

struct EventDetailView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            eventImageView

            Text(event.name)
                .font(.custom("AvenirNext-Bold", size: 24))
                .foregroundColor(Color("KDOrange"))

            eventDate
                .font(.custom("AvenirNext-Regular", size: 20))
                .foregroundColor(.white)

            eventTiming
                .font(.custom("AvenirNext-Regular", size: 20))
                .foregroundColor(.white)

            Text(event.location)
                .font(.custom("AvenirNext-Regular", size: 20))
                .foregroundColor(.white)

            speakersGroup

            companiesGroup


            Spacer()

            dismissalButton
        }
        .padding()
    }
    
    var eventImageView: some View {
        event.image
            .resizable()
            .scaledToFit()
    }
    
    var eventDate: some View {
        Text(event.date)
    }

    var eventTiming: some View {
        Text("\(event.start_time) - \(event.end_time)")
    }
    
    var speakersGroup: some View {
        Group {
            Text("Speakers:")
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(Color("KDOrange"))
            if let speakers = event.speakers {
                ForEach(speakers, id: \.self) { speaker in
                    Text(speaker)
                        .font(.custom("AvenirNext-Regular", size: 18))
                        .foregroundColor(Color("KDOrange"))
                }
            } else {
                Text("No speakers listed.")
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(.white)
            }
        }
    }
    
    var companiesGroup: some View {
        Group {
            Text("Companies:")
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(Color("KDOrange"))
            if let companies = event.companies {
                ForEach(companies, id: \.self) { company in
                    Text(company)
                        .font(.custom("AvenirNext-Regular", size: 18))
                        .foregroundColor(.white)
                }
            } else {
                Text("No companies listed.")
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(.white)
            }
        }
    }
    
    var addToCalendarButton: some View {
        Button(action: {
            addToCalendar(event: event)
        }) {
            HStack {
                Image(systemName: "calendar")
                Text("Legg til i kalender")
            }
        }
        .padding()
        .background(Color("KDBlue"))
        .foregroundColor(.white)
        .cornerRadius(10)
    }
    
    func addToCalendar(event: Event) {
        let eventStore = EKEventStore()
        
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(store: eventStore, event: event)
        case .denied:
            print("Access denied")
        case .notDetermined:
            eventStore.requestAccess(to: .event, completion: { (granted: Bool, error: Error?) -> Void in
                if granted {
                    insertEvent(store: eventStore, event: event)
                } else {
                    print("Access denied")
                }
            })
        default:
            print("Case Default")
        }
    }

    func insertEvent(store: EKEventStore, event: Event) {
        let ekEvent = EKEvent(eventStore: store)
        
        ekEvent.title = event.name
        
        // Combine the event's date, start_time, and end_time to form full Date objects
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let startDate = dateFormatter.date(from: "\(event.date) \(event.start_time)"),
           let endDate = dateFormatter.date(from: "\(event.date) \(event.end_time)") {
            ekEvent.startDate = startDate
            ekEvent.endDate = endDate
        } else {
            print("Error: Could not convert date and time to Date object")
            return
        }
        
        ekEvent.notes = event.description
        ekEvent.calendar = store.defaultCalendarForNewEvents
        
        do {
            try store.save(ekEvent, span: .thisEvent)
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }

    
    var dismissalButton: some View {
        HStack(alignment: .center) {
            Spacer()
            
            VStack {
                addToCalendarButton
                Spacer()
                DismissScheduleDetailSheetButton()
            }
            Spacer()
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: events[0]) // Assuming events is an array of Event objects
    }
}

struct DismissScheduleDetailSheetButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Tilbake")
                .font(.custom("AvenirNext-Bold", size: 18))
                .foregroundColor(.white)
        }
        .dismissButtonStyle()
    }
}

extension View {
    func dismissButtonStyle() -> some View {
        self
            .padding(10)
            .foregroundColor(.white)
            .background(Color("KDOrange"))
            .clipShape(Rectangle())
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("KDOrange"), lineWidth: 4)
            )
    }
}
