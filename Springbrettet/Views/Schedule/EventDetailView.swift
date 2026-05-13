import SwiftUI

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
            Task {
                do {
                    try await EventCalendarExporter().export(event)
                    await MainActor.run { showingCalendarAlert = true }
                } catch {
                    print("Calendar export failed: \(error)")
                }
            }
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

}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: ContentStore().events[2])
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
