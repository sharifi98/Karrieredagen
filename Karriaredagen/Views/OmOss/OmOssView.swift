//
//  OmOssView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 24/06/2023.
//

import SwiftUI

struct OmOssView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("marinebackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                

                List {
                    Section {
                        NavigationLink(destination: KarrieredagenInformationView()) {
                            Label {
                                Text("Karrieredagen")
                            } icon: {
                                Image(systemName: "network")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        NavigationLink(destination: KarrieredagenInformationView()) {
                            Label {
                                Text("Springbrettfondet")
                            } icon: {
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .foregroundColor(.green)
                            }
                        }
                        
                        NavigationLink(destination: KarrieredagenInformationView()) {
                            Label {
                                Text("Prosjekter")
                            } icon: {
                                Image(systemName: "hammer")
                                    .foregroundColor(.purple)
                            }
                        }
                        
                        NavigationLink(destination: HvemErSpringbrettetView()) {
                            Label {
                                Text("Hva er Springbrettet?")
                            } icon: {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Section {
                        Button(action: {
                            if let url = URL(string: "https://www.facebook.com/springbrettet/") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "person")
                                Text("Facebook")
                            }
                            .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            if let url = URL(string: "https://www.instagram.com/springbrettet/") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "camera")
                                Text("Instagram")
                            }
                            .foregroundColor(.pink)
                        }
                        
                        Button(action: {
                            if let url = URL(string: "https://www.linkedin.com/company/springbrettet/mycompany/") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "point.3.filled.connected.trianglepath.dotted")
                                Text("LinkedIn")
                            }
                            .foregroundColor(.cyan)
                        }
                    }
                }
                .foregroundColor(.orange)
                .listStyle(.grouped)
                .navigationBarWithOrangeBackground()
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Text("Om oss")
                            .font(.custom("AvenirNext-Bold", size: 25))
                            .foregroundColor(Color("KDOrange"))
                    }
            }
            }
        }
    }
}

struct OmOssView_Previews: PreviewProvider {
    static var previews: some View {
        OmOssView()
    }
}

