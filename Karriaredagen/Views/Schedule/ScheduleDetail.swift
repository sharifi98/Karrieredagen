//
//  ScheduleDetail.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 02/06/2023.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            eventImageView

            Text(event.name)
                .font(.title)

            eventTiming
                .font(.subheadline)

            Text(event.location)
                .font(.subheadline)

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
    
    var eventTiming: some View {
        Text("\(event.start_time) - \(event.end_time)")
    }
    
    var speakersGroup: some View {
        Group {
            Text("Speakers:")
                .font(.headline)
            if let speakers = event.speakers {
                ForEach(speakers, id: \.self) { speaker in
                    Text(speaker)
                }
            } else {
                Text("No speakers listed.")
            }
        }
    }
    
    var companiesGroup: some View {
        Group {
            Text("Companies:")
                .font(.headline)
            if let companies = event.companies {
                ForEach(companies, id: \.self) { company in
                    Text(company)
                }
            } else {
                Text("No companies listed.")
            }
        }
    }
    
    var dismissalButton: some View {
        HStack(alignment: .center) {
            Spacer()
            DismissScheduleDetailSheetButton()
            Spacer()
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: events[0])
    }
}

struct DismissScheduleDetailSheetButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Tilbake")
        }
        .dismissButtonStyle()
    }
}

extension View {
    func dismissButtonStyle() -> some View {
        self
            .padding(10)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .background(.orange)
            .cornerRadius(15)
    }
}
