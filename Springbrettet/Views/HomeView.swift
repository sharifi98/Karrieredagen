import SwiftUI
import MapKit
import WebKit
import SDWebImageSwiftUI

struct HomeView: View {
    @State private var selectedEvent: Event?
    @State private var selectedView: String = "CompanyList"
    let grieghallencord = CLLocationCoordinate2D(latitude: 60.38880103170712, longitude: 5.328235989579929)
    
    let imageNames = [
        "DSC06717",
        "DSC06261-2",
        "DSC06217",
        "DSC06236",
        "DSC06272",
        "DSC06279",
        "DSC06291",
        "DSC06322",
        "DSC06337-2",
        "DSC06439",
        "DSC06452",
        "DSC06466",
        "DSC06482",
        "DSC06485",
        "DSC06492",
        "DSC06633",
        "DSC06728",
    ]
    
    @State private var selectedImageIndex = 0

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
                        .padding(-30)
                        
                    }

                    VStack {
                        Text("Alt du trenger å vite om Karrieredagen og Springbrettet, samlet på ett sted.")
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

                    NavigationLink(destination: FeedBackView()) {
                        Label("Tilbakemelding", systemImage: "questionmark.bubble")
                    }.foregroundColor(Color("KDOrange"))
                    
                    NavigationLink(destination: CVTipsView()) {
                        Label("Tips til jobbsøknad", systemImage: "pencil")
                    }.foregroundColor(Color("KDOrange"))
                }
                
                Section(header: Text("Springbrettets prosjekter")) {
                    NavigationLink(destination: SpringbrettfondetView()) {
                        Label {
                            Text("Springbrettfondet")
                        } icon: {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .foregroundColor(.green)
                        }
                    }
                    
                    NavigationLink(destination: DiTView()) {
                        Label {
                            Text("Damer i toppen")
                        } icon: {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    NavigationLink(destination: Karrierestudio()) {
                        Label {
                            Text("Karrierestudio")
                        } icon: {
                            Image(systemName: "music.mic")
                                .foregroundColor(.purple)
                        }
                    }

                    
                }

                VStack {
                    TabView(selection: $selectedImageIndex) {
                        ForEach(imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 288, height: 220)
                                .shadow(color: Color.black.opacity(0.9), radius: 7, x: 10, y: 10)
                                .padding(.vertical)
                                .tag(imageNames.firstIndex(of: imageName)!)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                    .padding()
                    
                    Text("Karrieredagen er  arrangement hvor studenter kan møte potensielle arbeidsgivere og få innsikt i forskjellige yrkesmuligheter. Dette er en ypperlig anledning for studenter til å knytte nettverk, lære mer om jobbmulighetene i sin bransje, og få verdifull veiledning fra erfarne fagfolk. Grieghallen, som ligger i hjertet av Bergen, tilbyr et ideelt sted for dette arrangementet med sin rikholdige plass og gode fasiliteter.")
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
                }
                .padding()

                VStack {
                    Section {
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
                                .foregroundColor(Color("KDOrange"))
                            Text("post@springbrettet.org")
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text("Springbrettet")
                                .foregroundColor(Color("KDOrange"))
                                .font(.custom("AvenirNext-Bold", size: 40))
                                .padding()
                            Spacer()
                        }
                    }
                }

            }
            .listStyle(.insetGrouped)
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

struct FeedBackView: View {
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
        HomeView()
    }
}
