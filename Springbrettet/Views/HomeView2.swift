//
//  HomeView2.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 10/11/2023.
//

import SwiftUI
import MapKit
import WebKit
import SDWebImageSwiftUI

struct HomeView2: View {
    
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
    @State private var showKarrieredagenInformationView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background3()
                ScrollView {
                    
                    VStack {
                            ZStack {
                                WebImage(url: Bundle.main.url(forResource: "KDaftermovie_cropped", withExtension: "gif"))
                                    .resizable()
                                    .frame(width: 500, height: 300)
                                    .clipped()
                                    .cornerRadius(10)
                                    .shadow(radius: 20)
                                    .opacity(0.9)
                                
                                VStack {
                                    Text("Karrieredagen")
                                        .font(.custom("AvenirNext-Bold", size: 40))
                                        .foregroundColor(Color("KDOrange"))
                                    
                                    Text("24.09.2024")
                                        .font(.custom("AvenirNext-Bold", size: 30))
                                        .foregroundColor(.white)
                                        .underline()
                                }
                                .padding(-30)
                            }
                        
                    }
                    .sheet(isPresented: $showKarrieredagenInformationView) {
                        KarrieredagenInformationView()
                            .presentationDetents([.fraction(1.0)])
                    }
                    
                    
                    
                    
                    VStack {
                        Text("Alt du trenger å vite om Karrieredagen og Springbrettet, samlet på ett sted.")
                            .font(.custom("AvenirNext-Regular", size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: 350)
                            .padding()
                            .multilineTextAlignment(.center)
                        Button {
                            self.showKarrieredagenInformationView.toggle()
                        } label: {
                            Text("Trykk her for mer informasjon") // Add this line
                                .font(.custom("AvenirNext-Bold", size: 18)) // Customize the font style and size
                                .foregroundColor(Color("KDOrange")) // Customize the text color
                        }
                    }
                    
                    
                    VStack {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: 400, height: 30)
                                .foregroundColor(Color("KDOrange"))
                            Text("KARRIEREDAGEN")
                                .font(.title3)
                                .bold()
                                .padding()
                        }
                        
                    }
                    
                    
                    
                    
                }
            }
        }
    }
}

struct Background3: View {
    let colors: [Color] = [
        Color("KDBlue"),
        Color("KDBlue"),
        Color("KDBlue")
    ]

    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    HomeView2()
}
