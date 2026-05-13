import SwiftUI

struct CallToActionSection: View {
    var body: some View {
        Section {
            NavigationLink(destination: Studenter()) {
                HStack {
                    Image("SB")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fill)

                    Text("Bli med i Springbrettet")
                }
            }
            .foregroundColor(.kdOrange)

            NavigationLink(destination: FeedBackView()) {
                Label("Tilbakemelding", systemImage: "questionmark.bubble")
            }
            .foregroundColor(.kdOrange)
        }
    }
}
