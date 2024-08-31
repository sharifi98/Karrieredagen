import SwiftUI
import MapKit
import WebKit
import SDWebImageSwiftUI

struct HomeView: View {
    @State private var selectedEvent: Event?
    @State private var selectedView: String = "CompanyList"


    //let grieghallencord = CLLocationCoordinate2D(latitude: 60.38880103170712, longitude: 5.328235989579929)
    
    
    
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
    @State private var showKarrieredagenInformationView = false
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    
                    Button {
                        self.showKarrieredagenInformationView.toggle()
                    } label: {
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
                    }
                    .sheet(isPresented: $showKarrieredagenInformationView) {
                        KarrieredagenInformationView()
                            .presentationDetents([.fraction(0.9)])
                    }
                    
                    
                    VStack {
                        Text("Alt du trenger å vite om Karrieredagen og Springbrettet, samlet på ett sted.")
                            .font(.custom("AvenirNext-Regular", size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: 350)
                            .padding()
                            .multilineTextAlignment(.center)
                        
                        Text("Trykk her for mer informasjon")
                            .font(.custom("AvenirNext-Bold", size: 18))
                            .foregroundColor(Color("KDOrange"))
                    }
                }
                .listRowBackground(Color("KDBlue"))
                
                
                
                Section {
                    
                    Text("Karrieredagen")
                        .foregroundColor(.white)
                        .font(.headline)
                        .listRowBackground(Color("KDOrange"))
                    
                    NavigationLink(destination: SponsorView()) {
                        Label {
                            Text("Karrieredagens sponsorer")
                        } icon: {
                            Image(systemName: "trophy.fill")
                                .foregroundStyle(Color("KDOrange"))
                        }
                    }
                    
                    NavigationLink(destination: CompanyList()) {
                        Label {
                            Text("Se bedriftene")
                        } icon: {
                            Image(systemName: "suitcase.fill")
                                .foregroundColor(Color("KDOrange"))
                        }
                    }
                    
                    NavigationLink(destination: ScheduleList()) {
                        Label {
                            Text("Timeplan")
                        } icon: {
                            Image(systemName: "calendar")
                                .foregroundColor(Color("KDOrange"))
                        }
                    }
                    
                    
                    
                    NavigationLink(destination: GrieghallenView()) {
                        Label {
                            Text("Kart")
                        } icon: {
                            Image(systemName: "map")
                                .foregroundColor(Color("KDOrange"))
                        }
                    }
                    
                    
                    
                    
                    NavigationLink(destination: CVTipsView()) {
                        Label {
                            Text("Tips til jobbsøknad")
                        } icon: {
                            Image(systemName: "pencil")
                                .foregroundColor(Color("KDOrange"))
                        }
                    }
                }
                
                /*
                 Section {
                 VStack {
                 
                 Text("Karrieredagen gir studenter mulighet til å møte arbeidsgivere, utforske yrkesmuligheter, bygge nettverk og få veiledning fra eksperter.")
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
                 Text("Arrangementet finner sted i Grieghallen i Bergen.")
                 .font(.custom("AvenirNext-Regular", size: 15))
                 .multilineTextAlignment(.center)
                 }
                 .padding()
                 }
                 .listRowBackground(Color("KDBlue"))
                 
                 */
                
                Section {
                    
                    Text("Springbrettets prosjekter")
                        .foregroundColor(.white)
                        .font(.headline)
                        .listRowBackground(Color("KDOrange"))
                    
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
                    
                    NavigationLink(destination: SalmonCityView()) {
                        Label {
                            Text("Salmon City")
                        } icon: {
                            Image(systemName: "fish")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Studenter()) {
                        HStack {
                            Image("SB")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fill)
                            
                            Text("Bli med i Springbrettet")
                        }
                    }.foregroundColor(Color("KDOrange"))
                    
                    
                    NavigationLink(destination: FeedBackView()) {
                        Label("Tilbakemelding", systemImage: "questionmark.bubble")
                    }.foregroundColor(Color("KDOrange"))
                    
                }
                
                
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
                                .foregroundColor(Color("KDOrange"))
                            Text("post@springbrettet.org")
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text("Springbrettet")
                                .foregroundColor(Color("KDOrange"))
                                .font(.custom("AvenirNext-Bold", size: 35))
                                .padding()
                            Spacer()
                        }
                        
                    }
                }
                .listRowBackground(Color("KDBlue"))
            }
            .listStyle(.insetGrouped)
            .navigationBarWithTransparentBackground()
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    HStack {
                        NavigationLink(destination: VorsjContentView()) {
                            Image("SB")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
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
        WebView(request: URLRequest(url: URL(string: "https://docs.google.com/forms/d/1l-rudvgcFhys5A-a-FWjxz3VVlhSD4cIIfOEqk-2RSU/edit")!))
    }
}

struct SalmonCityView: View {
    var body: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.salmoncity.no/")!))
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
