//
//  ScheduleList.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct ScheduleList: View {
    @State private var isShowingSheet = false
    @State private var selectedEvent: Event?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Divider()
                    
                    ForEach(events) { event in
                        Button(action: {
                            selectedEvent = event
                            isShowingSheet = true
                        }) {
                            ScheduleRow(event: event)
                        }
                    }
                    
                }
                .padding(.horizontal)
            } 
            .sheet(isPresented: $isShowingSheet) {
                // Here you pass the selected event to your detail view
                if let eventDetail = selectedEvent {
                    EventDetailView(event: eventDetail)
                }
            }
            .navigationTitle("Timeplan")
        }
    }
}


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
