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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(event.name)
                    .font(.title)

                Text("\(event.start_time) - \(event.end_time)")
                    .font(.subheadline)

                Text(event.location)
                    .font(.subheadline)
                
                Spacer()

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

                Spacer()

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
                
                event.image
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: events[0])
    }
}
