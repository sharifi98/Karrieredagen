import SwiftUI
import SDWebImageSwiftUI

struct KarrieredagenInformationView: View {

    var body: some View {
        
            List {
                VStack {
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
                        }
                    
                }
                .padding()
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
                
                VStack {
                    Text("Vestlandets største tverrfaglige møteplass for bedrifter og studenter.")
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .frame(maxWidth: 350)
                        .foregroundColor(Color("KDOrange"))
                        .lineSpacing(5)
                        .multilineTextAlignment(.center)
                    
                    Text("Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet. Samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere! \n\nVi er stolte over å være arrangør for Vestlandets største tverrfaglige møteplass som knytter studenter og arbeidsmarkedet tettere sammen.")
                        .font(.custom("AvenirNext-Regular", size: 20))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: 350)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
            .listStyle(GroupedListStyle())
    }
}

struct KarrieredagenInformationView_Previews: PreviewProvider {
    static var previews: some View {
        KarrieredagenInformationView()
    }
}
