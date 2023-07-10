//
//  OmOssView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 24/06/2023.
//

import SwiftUI

struct OmOssView: View {
    
    let images1 = ["Screenshot 2023-07-05 at 15-56-54 Springbrettfondet — Springbrettet", "Screenshot 2023-07-05 at 15-57-16 Springbrettfondet — Springbrettet"]
    
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
                        
                        NavigationLink(destination: SpringbrettfondetView()) {
                            Label {
                                Text("Springbrettfondet")
                            } icon: {
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .foregroundColor(.green)
                            }
                        }
                        
                        NavigationLink(destination: Karrierestudio()) {
                            Label {
                                Text("Karrierestudio")
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
                .navigationBarWithTransparentBackground()
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

