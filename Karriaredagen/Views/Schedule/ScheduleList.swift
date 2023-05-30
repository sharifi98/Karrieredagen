//
//  ScheduleList.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct ScheduleList: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(events) { event in
                        NavigationLink {
                            ScheduleRow(event: event)
                        } label: {
                            ScheduleRow(event: event)
                        }
                    }
                    
                    ForEach(events) { event in
                        NavigationLink {
                            ScheduleRow(event: event)
                        } label: {
                            ScheduleRow(event: event)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Arrangementer")
        }
    }
}


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
