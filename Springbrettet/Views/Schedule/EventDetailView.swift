import SwiftUI
import EventKit

struct EventDetailView: View {
    var event: Event
    @Environment(\.dismiss) private var dismiss
    @State private var showingCalendarAlert = false

    var body: some View {
        ZStack {
            BackgroundSB2()
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    eventImageView

                    VStack(spacing: 10) {
                        Text(event.name)
                            .font(.kdHeading(24))
                            .foregroundColor(.kdOrange)

                        eventTiming

                        Text(event.location)
                            .font(.kdBody(18))

                        Text(event.description)
                            .font(.kdBody(16))
                            .multilineTextAlignment(.center)
                            .padding(.vertical)

                        speakersGroup

                        companiesGroup
                    }
                    .foregroundColor(.kdText)

                    VStack(spacing: 15) {
                        addToCalendarButton
                        dismissButton
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .alert("Added to Calendar", isPresented: $showingCalendarAlert) {
            Button("OK", role: .cancel) { }
        }
    }

    var eventImageView: some View {
        event.image
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 5)
    }

    var eventTiming: some View {
        Text("\(event.date), \(event.start_time) - \(event.end_time)")
            .font(.kdBody(18))
    }

    var speakersGroup: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Foredragsholder:")
                .font(.kdHeading(20))
                .foregroundColor(.kdOrange)
            if let speakers = event.speakers {
                ForEach(speakers, id: \.self) { speaker in
                    Text(speaker)
                        .font(.kdBody(16))
                }
            } else {
                Text("No speakers listed.")
                    .font(.kdBody(16))
                    .foregroundColor(.kdSecondary)
            }
        }
    }

    var companiesGroup: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Bedrift:")
                .font(.kdHeading(20))
                .foregroundColor(.kdOrange)
            if let companies = event.companies {
                ForEach(companies, id: \.self) { company in
                    Text(company)
                        .font(.kdBody(16))
                }
            } else {
                Text("No companies listed.")
                    .font(.kdBody(16))
                    .foregroundColor(.kdSecondary)
            }
        }
    }

    var addToCalendarButton: some View {
        Button(action: {
            addToCalendar(event: event)
        }) {
            Label("Legg til i kalender", systemImage: "calendar")
                .font(.kdBody(16))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
    }

    var dismissButton: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Tilbake")
                .font(.kdBody(16))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.kdOrange)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    func addToCalendar(event: Event) {
        let eventStore = EKEventStore()

        eventStore.requestAccess(to: .event) { granted, error in
            if granted {
                insertEvent(store: eventStore, event: event)
            } else {
                print("Calendar access denied")
            }
        }
    }

    func insertEvent(store: EKEventStore, event: Event) {
        let ekEvent = EKEvent(eventStore: store)
        ekEvent.title = event.name

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"

        if let startDate = dateFormatter.date(from: "\(event.date) \(event.start_time)"),
           let endDate = dateFormatter.date(from: "\(event.date) \(event.end_time)") {
            ekEvent.startDate = startDate
            ekEvent.endDate = endDate
            ekEvent.notes = event.description
            ekEvent.calendar = store.defaultCalendarForNewEvents

            do {
                try store.save(ekEvent, span: .thisEvent)
                DispatchQueue.main.async {
                    showingCalendarAlert = true
                }
            } catch {
                print("Error saving event: \(error.localizedDescription)")
            }
        } else {
            print("Error: Could not convert date and time to Date object")
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: events[2])
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
            .cornerRadius(10)
    }
}
