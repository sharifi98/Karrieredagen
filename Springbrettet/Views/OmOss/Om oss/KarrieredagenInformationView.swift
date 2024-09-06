import SwiftUI
import SDWebImageSwiftUI

// MARK: - KarrieredagenInformationView

struct KarrieredagenInformationView: View {
    @State private var animateMembers = false

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSB()
                ScrollView {
                    VStack(spacing: 30) {
                        HeaderView2()
                        InfoTextView()
                        Divider()
                            .background(Color.white)
                            .padding(.horizontal)
                        TeamMembersView(animateMembers: $animateMembers)
                        TeamImageView()
                    }
                    .padding()
                }
            }
        }
        .onAppear { withAnimation(.easeInOut(duration: 0.6)) { animateMembers = true } }
    }
}

struct HeaderView2: View {
    var body: some View {
        Text("Karrieredagen")
            .font(.custom("AvenirNext-Bold", size: 40))
            .foregroundColor(Color("KDOrange"))
            .padding()
            .shadow(radius: 5)
    }
}

struct InfoTextView: View {
    var body: some View {
        VStack(spacing: 24) {

            Text("Vestlandets største")
                .font(.custom("AvenirNext-DemiBold", size: 25))
                .foregroundColor(Color("KDOrange"))
                .multilineTextAlignment(.center)
                .padding(.bottom, -20)

            Text("møteplass for studenter og bedrifter")
                .font(.custom("AvenirNext-DemiBold", size: 20))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)

            Text("Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet, samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere!")
                .font(.custom("AvenirNext-DemiBold", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            VStack(spacing: 20) {
                InfoTextItem(
                    icon: "lightbulb",
                    text: "Bli inspirert"
                )
                InfoTextItem(
                    icon: "link",
                    text: "Utvid ditt nettverk"
                )
                InfoTextItem(
                    icon: "chart.line.uptrend.xyaxis",
                    text: "Voks sammen med andre"
                )
            }

            Text("Vi er stolte over å være katalysatoren som bringer studenter og arbeidsmarkedet sammen, og skaper en plattform for fremtidens suksesshistorier.")
                .font(.custom("AvenirNext-Regular", size: 16))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.top, 8)

        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.1))
                .shadow(color: .white.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding()
    }
}
struct InfoTextItem: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(Color("KDOrange"))
                .font(.system(size: 24))
                .frame(width: 32, height: 32)
                .clipShape(Circle())

            Text(text)
                .font(.custom("AvenirNext-Regular", size: 16))
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct TeamMembersView: View {
    @Binding var animateMembers: Bool

    var body: some View {
        VStack {
            Text("Gruppen bak Karrieredagen 2023")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.bottom, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(springbrettereData, id: \.id) { member in
                        NavigationLink(destination: PersonView(person: member)) {
                            MemberCard(member: member)
                        }
                        .offset(y: animateMembers ? 0 : 50)
                        .opacity(animateMembers ? 1 : 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0).delay(Double(member.id) * 0.1), value: animateMembers)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct MemberCard: View {
    let member: Person

    var body: some View {
        VStack {
            member.image
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("KDOrange"), lineWidth: 3))
                .shadow(radius: 5)

            Text(member.name)
                .font(.headline)
                .foregroundColor(.primary)

            Text(member.role)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct TeamImageView: View {
    var body: some View {
        Image("teamkd")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 350)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            .padding()
    }
}

// MARK: - PersonView

struct PersonView: View {
    let person: Person
    @Environment(\.openURL) var openURL

    var body: some View {
        ZStack {
            BackgroundSB()
            ScrollView {
                VStack(spacing: 20) {
                    PersonImageView(imageName: person.imageName)
                    PersonInfoView(person: person)
                    LinkedInButton(url: person.linkedin)
                }
                .padding()
            }
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
    }
}

struct PersonInfoView: View {
    let person: Person

    var body: some View {
        VStack(spacing: 10) {
            Text(person.name)
                .font(.custom("AvenirNext-Bold", size: 24))
                .foregroundColor(Color("KDOrange"))

            Text(person.role)
                .font(.custom("AvenirNext-Bold", size: 18))

            Text(person.studie)
                .font(.custom("AvenirNext-Regular", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Button(action: {
                if let url = URL(string: "mailto:\(person.email)") {
                    UIApplication.shared.open(url)
                }
            }) {
                Text(person.email)
                    .font(.custom("AvenirNext-Regular", size: 16))
                    .foregroundColor(.blue)
                    .underline()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.1))
        )
    }
}

struct LinkedInButton: View {
    let url: String
    @Environment(\.openURL) var openURL

    var body: some View {
        Button(action: {
            if let url = URL(string: url) {
                openURL(url)
            }
        }) {
            Image("linkedin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct KarrieredagenInformationView_Previews: PreviewProvider {
    static var previews: some View {
        KarrieredagenInformationView()
    }
}

struct PersonView_Previews: PreviewProvider {
    static let persons: [Person] = load("springbrettereData.json")
    static var previews: some View {
        PersonView(person: persons[4])
    }
}
