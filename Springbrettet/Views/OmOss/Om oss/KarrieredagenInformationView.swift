import SwiftUI
import SDWebImageSwiftUI

struct KarrieredagenInformationView: View {
    @State private var animateMembers = false
    
    var body: some View {
        
            List {
                VStack {
                        WebImage(url: Bundle.main.url(forResource: "KDaftermovie_cropped", withExtension: "gif"))
                            .resizable()
                            .frame(width: 500, height: 300)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 20)
                        
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
                        .foregroundColor(.white)
                        .lineSpacing(5)
                        .multilineTextAlignment(.center)
                    
                    Text("Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet. Samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere! \n\nVi er stolte over å være arrangør for Vestlandets største tverrfaglige møteplass som knytter studenter og arbeidsmarkedet tettere sammen.")
                        .font(.custom("AvenirNext-Regular", size: 20))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: 350)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Rectangle().frame(height: 2)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    Text("Gruppen bak Karrieredagen 2023")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(width: 370, height: 200)
                            .clipShape(Rectangle())
                            .cornerRadius(20)
                            .foregroundColor(Color("KDOrange"))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(springbrettereData, id: \.id) { member in
                                    
                                    NavigationLink {
                                        PersonView(person: member)
                                    } label: {
                                        VStack {
                                            member.image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 100)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color("KDOrange"), lineWidth: 6)
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
                
            

            }
            .listStyle(GroupedListStyle())
    }
}




struct KarrieredagenInformationView_Previews: PreviewProvider {
    static var previews: some View {
        KarrieredagenInformationView()
    }
}


