import SwiftUI
import MapKit
import SDWebImageSwiftUI

struct KDView: View {
    @State private var showCompanyList = false
    @State private var showScheduleList = false
    @State private var showGriegView = false
    @State private var selectedEvent: Event?
    let grieghallencord = CLLocationCoordinate2D(latitude: 60.38880103170712, longitude: 5.328235989579929)

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Image("marinebackground")
                        .resizable()
                        .ignoresSafeArea()

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
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: 350)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                        }
                    
                        
                        VStack {
                            
                            NavigationButton(destination: CompanyList(), text: "Se bedriftene", image: Image(systemName: "suitcase"), showView: $showCompanyList)
                            
                            NavigationButton(destination: ScheduleList(), text: "Timeplan", image: Image(systemName: "calendar"), showView: $showScheduleList)
                            
                            NavigationButton(destination: GriegView(), text: "Kart", image: Image(systemName: "map"), showView: $showGriegView)
                            
                        }
                        
                        Text("")
                            .padding(30)
                        
                        VStack {
                            Text("Karrieredagen holdes i Grieghallen")
                                .font(.custom("AvenirNext-Regular", size: 20))
                                .foregroundColor(.white)

                            MapView(coordinate: grieghallencord)
                                .frame(width: 300, height: 300/1.618)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 4)
                                )
                                .shadow(radius: 7)
                                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 20)))
                                .padding()
                        }
                        .padding()
                        

                        VStack {
                            
                            
                            
                            Text("Kontakt oss")
                                .foregroundColor(.gray)
                            
                            HStack {
                                
                                Image(systemName: "mappin")
                                    .foregroundColor(.red)
                                Text("Christies gate 9, 5015 Bergen")
                            }

                            
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.white)
                                Text("post@springbrettet.org")
                            }
                        }
                    
                        
                        Text("Springbrettet")
                            .foregroundStyle(Color("KDOrange"))
                            .font(.custom("AvenirNext-Bold", size: 40))
                            .padding()
                    }
                    .frame(maxHeight: .infinity, alignment: .top)

                }
            }
            .background(Color("KDBlue"))
            .navigationBarWithTransparentBackground()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack(alignment: .center) {
                        Image("SB")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 10.0)

                        /*
                        Text("Springbrettet")
                            .font(.custom("AvenirNext-Bold", size: 36))
                            .foregroundColor(Color("KDOrange"))
                            .padding(.bottom, 15.0)
                         */
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
        .foregroundColor(.white)
    }
}

struct NavigationButton<Destination: View>: View {
    var destination: Destination
    var text: String
    var image: Image
    @Binding var showView: Bool

    var body: some View {
        Button(action: { showView = true }) {
            HStack {
                image
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)

                Text(text)
                    .font(.custom("AvenirNext-Bold", size: 20))
            }
            .padding()
            .frame(minWidth: 200, maxWidth: 200)
            .background(Color("KDOrange"))
            .foregroundColor(.white)
            .cornerRadius(11)
            .shadow(color: Color.black.opacity(0.6), radius: 7, x: 10, y: 10)
        }
        .background(
            NavigationLink(
                destination: destination,
                isActive: $showView,
                label: { EmptyView() }
            )
            .hidden()
        )
        .padding(.bottom)
    }
}


struct KDView_Previews: PreviewProvider {
    static var previews: some View {
        KDView()
    }
}
