import SwiftUI


struct OmOssView: View {

    let images1 = ["Screenshot 2023-07-05 at 15-56-54 Springbrettfondet — Springbrettet", "Screenshot 2023-07-05 at 15-57-16 Springbrettfondet — Springbrettet"]

    

    var body: some View {

        NavigationView {

            List {

                Section(header: Text("Springbrettet")) {

                    NavigationLink(destination: HvemErSpringbrettetView()) {

                        Label("Hva er Springbrettet?", systemImage: "info.circle")

                            .foregroundColor(.gray)

                    }

                    

                    NavigationLink(destination: KarrieredagenInformationView()) {

                        Label("Karrieredagen", systemImage: "network")

                            .foregroundColor(.blue)

                    }

                }

                

                Section(header: Text("Følg oss")) {

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

            }

            .listStyle(GroupedListStyle())


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
