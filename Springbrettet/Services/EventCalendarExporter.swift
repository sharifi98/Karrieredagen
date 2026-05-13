import EventKit
import Foundation

final class EventCalendarExporter {
    enum ExportError: Error {
        case accessDenied
        case dateConversionFailed
    }

    func export(_ event: Event) async throws {
        let eventStore = EKEventStore()

        let granted: Bool
        if #available(iOS 17.0, *) {
            granted = try await eventStore.requestFullAccessToEvents()
        } else {
            granted = try await withCheckedThrowingContinuation { continuation in
                eventStore.requestAccess(to: .event) { granted, error in
                    if let error = error { continuation.resume(throwing: error) }
                    else { continuation.resume(returning: granted) }
                }
            }
        }

        guard granted else { throw ExportError.accessDenied }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"

        guard
            let startDate = dateFormatter.date(from: "\(event.date) \(event.start_time)"),
            let endDate = dateFormatter.date(from: "\(event.date) \(event.end_time)")
        else {
            throw ExportError.dateConversionFailed
        }

        let ekEvent = EKEvent(eventStore: eventStore)
        ekEvent.title = event.name
        ekEvent.startDate = startDate
        ekEvent.endDate = endDate
        ekEvent.notes = event.description
        ekEvent.calendar = eventStore.defaultCalendarForNewEvents

        try eventStore.save(ekEvent, span: .thisEvent)
    }
}
