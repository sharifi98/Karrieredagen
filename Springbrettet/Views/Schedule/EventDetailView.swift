import SwiftUI

struct EventDetailView: View {
    var event: Event
    @Environment(\.dismiss) private var dismiss
    @State private var showingCalendarAlert = false
    @State private var exportError: String?
    @State private var showingExportError = false

    var body: some View {
        ZStack {
            BackgroundSB2()
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    EventImageSection(event: event)

                    VStack(spacing: 10) {
                        Text(event.name)
                            .font(.kdHeading(24))
                            .foregroundColor(.kdOrange)

                        EventTimingView(event: event)

                        Text(event.location)
                            .font(.kdBody(18))

                        Text(event.description)
                            .font(.kdBody(16))
                            .multilineTextAlignment(.center)
                            .padding(.vertical)

                        SpeakersSection(event: event)

                        CompaniesSection(event: event)
                    }
                    .foregroundColor(.kdText)

                    VStack(spacing: 15) {
                        AddToCalendarButton(
                            event: event,
                            onSuccess: { showingCalendarAlert = true },
                            onError: { message in
                                exportError = message
                                showingExportError = true
                            }
                        )
                        DismissButton(dismiss: dismiss)
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .alert("Added to Calendar", isPresented: $showingCalendarAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("Could not add to Calendar", isPresented: $showingExportError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(exportError ?? "An unknown error occurred.")
        }
    }
}

// MARK: - Sub-views

private struct EventImageSection: View {
    let event: Event

    var body: some View {
        event.image
            .resizable()
            .scaledToFit()
            .cornerRadius(.radiusSmall)
            .shadow(radius: 5)
    }
}

private struct EventTimingView: View {
    let event: Event

    var body: some View {
        Text("\(event.date), \(event.start_time) - \(event.end_time)")
            .font(.kdBody(18))
    }
}

private struct SpeakersSection: View {
    let event: Event

    var body: some View {
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
}

private struct CompaniesSection: View {
    let event: Event

    var body: some View {
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
}

private struct AddToCalendarButton: View {
    let event: Event
    let onSuccess: () -> Void
    let onError: (String) -> Void

    var body: some View {
        Button(action: {
            Task {
                do {
                    try await EventCalendarExporter().export(event)
                    await MainActor.run { onSuccess() }
                } catch EventCalendarExporter.ExportError.accessDenied {
                    await MainActor.run { onError("Calendar access was denied. Please enable it in Settings.") }
                } catch EventCalendarExporter.ExportError.dateConversionFailed {
                    await MainActor.run { onError("The event date or time could not be parsed.") }
                } catch {
                    await MainActor.run { onError(error.localizedDescription) }
                }
            }
        }) {
            Label("Legg til i kalender", systemImage: "calendar")
                .font(.kdBody(16))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(.radiusSmall)
        }
    }
}

private struct DismissButton: View {
    let dismiss: DismissAction

    var body: some View {
        Button(action: { dismiss() }) {
            Text("Tilbake")
                .font(.kdBody(16))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.kdOrange)
                .foregroundColor(.white)
                .cornerRadius(.radiusSmall)
        }
    }
}

// MARK: - Preview

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: ContentStore().events[2])
    }
}

// MARK: - Shared dismiss button (legacy, kept for other call sites)

struct DismissScheduleDetailSheetButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Tilbake")
                .font(.kdHeading(18))
                .foregroundColor(.white)
        }
        .dismissButtonStyle()
    }
}

extension View {
    func dismissButtonStyle() -> some View {
        self
            .padding(.spacingBase)
            .foregroundColor(.white)
            .background(Color.kdOrange)
            .cornerRadius(.radiusSmall)
    }
}
