import SwiftUI

struct EventDetailView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            eventImageView

            Text(event.name)
                .font(.custom("AvenirNext-Bold", size: 24))
                .foregroundColor(Color("KDOrange"))

            eventTiming
                .font(.custom("AvenirNext-Regular", size: 20))
                .foregroundColor(Color("KDOrange"))

            Text(event.location)
                .font(.custom("AvenirNext-Regular", size: 20))
                .foregroundColor(Color("KDOrange"))

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
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(Color("KDOrange"))
            if let speakers = event.speakers {
                ForEach(speakers, id: \.self) { speaker in
                    Text(speaker)
                        .font(.custom("AvenirNext-Regular", size: 18))
                        .foregroundColor(Color("KDOrange"))
                }
            } else {
                Text("No speakers listed.")
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(Color("KDOrange"))
            }
        }
    }
    
    var companiesGroup: some View {
        Group {
            Text("Companies:")
                .font(.custom("AvenirNext-Bold", size: 20))
                .foregroundColor(Color("KDOrange"))
            if let companies = event.companies {
                ForEach(companies, id: \.self) { company in
                    Text(company)
                        .font(.custom("AvenirNext-Regular", size: 18))
                        .foregroundColor(Color("KDOrange"))
                }
            } else {
                Text("No companies listed.")
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(Color("KDOrange"))
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
                .font(.custom("AvenirNext-Bold", size: 18))
                .foregroundColor(Color("KDOrange"))
        }
        .dismissButtonStyle()
    }
}

extension View {
    func dismissButtonStyle() -> some View {
        self
            .padding(10)
            .foregroundColor(Color("KDOrange"))
            .background(Color.white)
            .clipShape(Rectangle())
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("KDOrange"), lineWidth: 4)
            )
    }
}
