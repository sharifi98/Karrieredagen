import SwiftUI


struct OmOssView: View {

    let images1 = ["Screenshot 2023-07-05 at 15-56-54 Springbrettfondet — Springbrettet", "Screenshot 2023-07-05 at 15-57-16 Springbrettfondet — Springbrettet"]

    

    var body: some View {

        NavigationView {

            List {
                
                
                Section {
                    
                    Text("Springbrettet")
                        .foregroundColor(.white)
                        .font(.headline)
                        .listRowBackground(Color("KDOrange"))
                    
                    NavigationLink(destination: HvaErSpringbrettet()) {
                        Label("Hva er Springbrettet?", systemImage: "info.circle")
                            .foregroundColor(Color("KDOrange"))
                    }
                    
                    NavigationLink(destination: KarrieredagenInformationView()) {
                        Label("Karrieredagen", systemImage: "network")
                            .foregroundColor(Color("KDOrange"))
                    }

                }
                
                
                
                
                
                Section {
                    
                    Text("Følg oss")
                        .foregroundColor(.white)
                        .font(.headline)
                        .listRowBackground(Color.blue)
                    
                    Button(action: {
                        openURL("https://www.facebook.com/springbrettet/")
                    }) {
                        Label("Facebook", systemImage: "person")
                            .foregroundColor(.blue)
                    }

                    Button(action: {
                        openURL("https://www.instagram.com/springbrettet/")
                    }) {
                        Label("Instagram", systemImage: "camera")
                            .foregroundColor(.pink)
                    }
                    
                    Button(action: {

                        openURL("https://www.linkedin.com/company/springbrettet/mycompany/")
                    }) {
                        Label("LinkedIn", systemImage: "point.3.connected.trianglepath.dotted")
                            .foregroundColor(.cyan)
                    }
                }
            
                // TODO
                // Add springbrett leader members
                
                Section {
                    
                    Text("Styret i Springbrettet")
                        .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color("KDOrange"), Color.yellow]), startPoint: .top, endPoint: .bottom))
                        
                    ZStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(lederData, id: \.id) { member in
                                    
                                    NavigationLink(destination: PersonView2(leder: member)) {
                                        VStack {
                                            
                                            
                                            member.image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 140)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color("KDOrange"), lineWidth: 3)
                                                )
                                            
                                            VStack {
                                                Text(member.name)
                                                    .font(.headline)
                                                    .foregroundColor(.primary)
                                                Text(member.role)
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            }
                                            
                                        }
                                        .padding()
                                    }

                                    
                                }
                            }
                            
                        }
                    }
                }

            
                
                
                VStack {
                    HStack {
                            Spacer()
                            Image("SB")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .aspectRatio(contentMode: .fill)
                            Spacer()
                    }
                    Text("Versjon 1.1.3")
                        .foregroundColor(.secondary)
                    Text("Laget av Hossein Sharifi")
                }
            }
            .listStyle(.automatic)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Om oss")
                        .font(.title)
                        .foregroundColor(Color("KDOrange"))
                }
            }
        }
    }

    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}


struct OmOssView_Previews: PreviewProvider {
    static var previews: some View {
        OmOssView()
    }
}
