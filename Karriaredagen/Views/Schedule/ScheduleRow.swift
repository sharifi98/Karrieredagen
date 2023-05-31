//
//  ScheduleRow.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct ScheduleRow: View {
    var event: Event
    var colors: [Color] = [.orange, .blue, .purple, .green, .pink, .yellow, .red, .gray]
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.title3)
                Text("\(event.start_time) - \(event.end_time)")
                    .font(.subheadline)
                Text("\(event.location)")
                    .font(.subheadline)
                

            }
            Spacer()
        }
        .padding(20)
        .foregroundColor(.white)
        .clipShape(Rectangle())
        .background(colors.randomElement() ?? .orange) // Use a random color, defaults to orange if randomElement() returns nil
        .cornerRadius(20)
        .shadow(radius: 4)
        
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRow(event: events[0])
    }
}
