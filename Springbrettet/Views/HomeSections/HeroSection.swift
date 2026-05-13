import SwiftUI
import SDWebImageSwiftUI

struct HeroSection: View {
    @State private var showKarrieredagenInformationView = false

    var body: some View {
        VStack {
            Button {
                showKarrieredagenInformationView.toggle()
            } label: {
                ZStack {
                    WebImage(url: Bundle.main.url(forResource: "kd24", withExtension: "gif"))
                        .resizable()
                        .frame(width: 400, height: 300)
                        .clipped()
                        .cornerRadius(.radiusSmall)
                        .shadow(radius: 20)
                        .opacity(0.5)

                    VStack {
                        Text("Karrieredagen")
                            .font(.kdHeading(40))
                            .foregroundColor(Color.kdOrange)

                        Text("23.09.2025")
                            .font(.kdHeading(30))
                            .foregroundColor(.white)
                            .underline()
                    }
                    .padding(-30)
                }
            }
            .sheet(isPresented: $showKarrieredagenInformationView) {
                KarrieredagenInformationView()
                    .presentationDetents([.fraction(0.9)])
            }

            VStack {
                Text("Alt du trenger å vite om Karrieredagen og Springbrettet, samlet på ett sted.")
                    .font(.kdBody(20))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: 350)
                    .padding()
                    .multilineTextAlignment(.center)

                Text("Trykk her for mer informasjon")
                    .font(.kdHeading(18))
                    .foregroundColor(.kdOrange)
            }
        }
        .listRowBackground(Color("KDBlue"))
    }
}
