import SwiftUI

// MARK: - KarrieredagenInformationView

struct KarrieredagenInformationView: View {
    @State private var animateMembers = false

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSB()
                    .ignoresSafeArea()
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
            .foregroundColor(.kdOrange)
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
                .foregroundColor(.kdOrange)
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
            RoundedRectangle(cornerRadius: .radiusLarge)
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
                .foregroundColor(.kdOrange)
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
    @EnvironmentObject var store: ContentStore
    @Binding var animateMembers: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Gruppen bak Karrieredagen 2024")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(store.springbrettere, id: \.id) { member in
                        NavigationLink(destination: PersonView(person: member)) {
                            PersonCard(person: member, mode: .compactHorizontal)
                                .scaleEffect(animateMembers ? 1 : 0.8)
                                .animation(
                                    .spring(response: 0.5, dampingFraction: 0.6)
                                        .delay(Double(member.id) * 0.1),
                                    value: animateMembers
                                )
                        }
                    }
                }
                .padding(.horizontal, .spacingMedium)
            }
        }
        .padding(.top)
    }
}

// MARK: - TeamImageView

struct TeamImageView: View {
    var body: some View {
        Image("teamkd")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 350)
            .clipShape(RoundedRectangle(cornerRadius: .radiusLarge))
            .shadow(radius: 10)
            .padding()
    }
}

// MARK: - PersonView

struct PersonView: View {
    let person: Person

    var body: some View {
        ZStack {
            BackgroundSB()
                .ignoresSafeArea()
            ScrollView {
                PersonCard(person: person, mode: .detail)
            }
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Previews

struct KarrieredagenInformationView_Previews: PreviewProvider {
    static var previews: some View {
        KarrieredagenInformationView()
            .environmentObject(ContentStore())
            .environment(\.colorScheme, .dark)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: ContentStore().springbrettere[0])
            .environment(\.colorScheme, .dark)
    }
}
