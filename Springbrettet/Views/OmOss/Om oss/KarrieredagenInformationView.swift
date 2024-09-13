import SwiftUI
import SDWebImageSwiftUI

// MARK: - KarrieredagenInformationView

struct KarrieredagenInformationView: View {
    @State private var animateMembers = false

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSB()
                    .ignoresSafeArea() // Ensures background covers entire screen
                ScrollView {
                    VStack(spacing: 30) {
                        HeaderView2()
                        InfoTextView()
                        Divider()
                            .background(Color.white.opacity(0.5))
                            .padding(.horizontal)
                        TeamMembersView(animateMembers: $animateMembers)
                        TeamImageView()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                animateMembers = true
            }
        }
    }
}

// MARK: - HeaderView

struct HeaderView2: View {
    var body: some View {
        Text("Karrieredagen")
            .font(.largeTitle.bold())
            .foregroundColor(Color("KDOrange"))
            .padding()
            .shadow(radius: 5)
    }
}

// MARK: - InfoTextView

struct InfoTextView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Vestlandets største")
                .font(.title2.weight(.semibold))
                .foregroundColor(Color("KDOrange"))
                .multilineTextAlignment(.center)

            Text("Møteplass for studenter og bedrifter")
                .font(.title3.weight(.medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text("""
            Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet, samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere!
            """)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            VStack(spacing: 20) {
                InfoTextItem(
                    icon: "lightbulb.fill",
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
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.3))
                .blur(radius: 0.5)
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
                .font(.title2)
                .frame(width: 32, height: 32)

            Text(text)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - TeamMembersView

struct TeamMembersView: View {
    @Binding var animateMembers: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Gruppen bak Karrieredagen 2024")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(springbrettereData, id: \.id) { member in
                        NavigationLink(destination: PersonView(person: member)) {
                            MemberCard(member: member)
                                .scaleEffect(animateMembers ? 1 : 0.8)
                                .animation(
                                    .spring(response: 0.5, dampingFraction: 0.6)
                                        .delay(Double(member.id) * 0.1),
                                    value: animateMembers
                                )
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.top)
    }
}

// MARK: - MemberCard

struct MemberCard: View {
    let member: Person

    var body: some View {
        VStack {
            member.image
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color("KDOrange"), lineWidth: 3)
                )
                .shadow(radius: 5)

            Text(member.name)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text(member.role)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .frame(width: 160)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black.opacity(0.2))
        )
    }
}

// MARK: - TeamImageView

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
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    PersonImageView(imageName: person.imageName)
                    PersonInfoView(person: person)
                    if !person.linkedin.isEmpty {
                        LinkedInButton(url: person.linkedin)
                    }
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
            .scaledToFit()
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
                .font(.title2.bold())
                .foregroundColor(Color("KDOrange"))

            Text(person.role)
                .font(.headline)
                .foregroundColor(.white)

            Text(person.studie)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)

            if !person.email.isEmpty {
                Button(action: {
                    if let url = URL(string: "mailto:\(person.email)") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text(person.email)
                        .font(.body)
                        .foregroundColor(.blue)
                        .underline()
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black.opacity(0.2))
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
            HStack {
                Image(systemName: "link")
                Text("View on LinkedIn")
            }
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )
        }
    }
}

// MARK: - Previews

struct KarrieredagenInformationView_Previews: PreviewProvider {
    static var previews: some View {
        KarrieredagenInformationView()
            .environment(\.colorScheme, .dark) // Preview in dark mode
    }
}

struct PersonView_Previews: PreviewProvider {
    static let persons: [Person] = load("springbrettereData.json")
    static var previews: some View {
        PersonView(person: persons[0])
            .environment(\.colorScheme, .dark)
    }
}
