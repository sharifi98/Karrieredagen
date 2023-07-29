import SwiftUI
import MapKit
import WebKit
import SDWebImageSwiftUI

struct KDView: View {
    @State private var selectedEvent: Event?
    let grieghallencord = CLLocationCoordinate2D(latitude: 60.38880103170712, longitude: 5.328235989579929)

    var body: some View {
        NavigationView {
            List {
                VStack {
                    ZStack {
                        WebImage(url: Bundle.main.url(forResource: "KDaftermovie_cropped", withExtension: "gif"))
                            .resizable()
                            .frame(width: 500, height: 300)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 20)
                            .opacity(0.5)

                        VStack {
                            Text("Karrieredagen")
                                .font(.custom("AvenirNext-Bold", size: 40))
                                .foregroundColor(Color("KDOrange"))

                            Text("26.09.2023")
                                .font(.custom("AvenirNext-Bold", size: 30))
                                .foregroundColor(.white)
                                .underline()
                        }
                    }

                    VStack {
                        Text("Alt du trenger å vite om Karrieredagen og Springbrettet, samlet på ett sted. Vi ser frem til en fantastisk dag.")
                            .font(.custom("AvenirNext-Regular", size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: 350)
                            .padding()
                            .multilineTextAlignment(.center)
                    }
                }

                Section(header: Text("Karrieredagen")) {
                    NavigationLink(destination: CompanyList()) {
                        Label("Se bedriftene", systemImage: "suitcase")
                    }.foregroundColor(Color("KDOrange"))

                    NavigationLink(destination: ScheduleList()) {
                        Label("Timeplan", systemImage: "calendar")
                    }.foregroundColor(Color("KDOrange"))

                    NavigationLink(destination: GriegView()) {
                        Label("Kart", systemImage: "map")
                    }.foregroundColor(Color("KDOrange"))

                    NavigationLink(destination: InstagramView()) {
                        Label("Tilbakemelding", systemImage: "questionmark.bubble")
                    }.foregroundColor(Color("KDOrange"))
                }

                Spacer() // Add a Spacer to push the VStack below towards the center of the screen

                VStack {
                    Text("Karrieredagen, et viktig arrangement hvor studenter kan møte potensielle arbeidsgivere og få innsikt i forskjellige yrkesmuligheter, vil bli holdt i Grieghallen. Dette er en ypperlig anledning for studenter til å knytte nettverk, lære mer om jobbmulighetene i sin bransje, og få verdifull veiledning fra erfarne fagfolk. Grieghallen, som ligger i hjertet av Bergen, tilbyr et ideelt sted for dette arrangementet med sin rikholdige plass og gode fasiliteter.")
                        .font(.custom("AvenirNext-Regular", size: 15))
                        .multilineTextAlignment(.center)

                    MapView(coordinate: grieghallencord)
                        .frame(width: 300, height: 300/1.618)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("KDBlue"), lineWidth: 4)
                        )
                        .shadow(radius: 7)
                        .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 20)))
                        .padding()
                }
                .padding()

                VStack(alignment: .center) {
                    Text("Kontakt oss")
                        .foregroundColor(.gray)

                    HStack(alignment: .center) {
                        Image(systemName: "mappin")
                            .foregroundColor(.red)
                        Text("Christies gate 9, 5015 Bergen")
                    }

                    HStack(alignment: .center) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("KDOrange"))
                        Text("post@springbrettet.org")
                    }
                    
                    Text("Springbrettet")
                        .foregroundColor(Color("KDOrange"))
                        .font(.custom("AvenirNext-Bold", size: 40))
                        .padding()
                }
                .padding()

            }
            .listStyle(GroupedListStyle())
            .navigationBarWithTransparentBackground()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack(alignment: .center) {
                        Image("SB")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 10.0)
                    }
                }
            }
            .overlay(Rectangle().foregroundColor(.clear))
            .sheet(item: $selectedEvent) { eventDetail in
                EventDetailView(event: eventDetail)
            }
        }
    }

    func eventRow(for event: Event) -> some View {
        Button(action: {
            selectedEvent = event
        }) {
            ScheduleRow(event: event)
        }
        .foregroundColor(Color("KDOrange"))
    }
}

struct InstagramView: View {
    var body: some View {
        WebView(request: URLRequest(url: URL(string: "https://docs.google.com/forms/d/1IFTBhLFb-sJoX3DxiBgVaUpGO8O4gqmeX8yR71EhgLM/edit")!))
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

struct KDView_Previews: PreviewProvider {
    static var previews: some View {
        KDView()
    }
}
