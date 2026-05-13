import SwiftUI

struct ContactInfoSection: View {
    var body: some View {
        Section {
            VStack {
                HStack {
                    Spacer()
                    Text("Kontakt oss")
                        .foregroundColor(.gray)
                    Spacer()
                }

                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "mappin")
                        .foregroundColor(.red)
                    Text("Christies gate 9, 5015 Bergen")
                    Spacer()
                }

                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.kdOrange)
                    Text("post@springbrettet.org")
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text("Springbrettet")
                        .foregroundColor(.kdOrange)
                        .font(.kdHeading(35))
                        .padding()
                    Spacer()
                }
            }
        }
        .listRowBackground(Color("KDBlue"))
    }
}
