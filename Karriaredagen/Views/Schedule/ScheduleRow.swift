//
//  ScheduleRow.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

// yespss
struct ScheduleRow: View {
    var event: Event
    var colors: [Color] = [.gray, .orange]
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.title3)
                    .foregroundColor(.orange)
                Text("\(event.start_time) - \(event.end_time)")
                    .font(.subheadline)
                Text("\(event.location)")
                    .font(.subheadline)
            }
            Spacer()
            Label("\(event.duration) min", systemImage: "clock")
        }
        .padding(20)
        .foregroundColor(.white)
        .clipShape(Rectangle())
        .background(Color(red: 0.02, green: 0.06, blue: 0.2))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
        
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRow(event: events[0])
    }
}
