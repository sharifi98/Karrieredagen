import SwiftUI

struct DiTView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSB()
                ScrollView {
                    VStack(spacing: 30) {
                        headerSection
                        missionSection
                        visionSection
                        socialMediaSection
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Damer i Toppen")
                        .font(.kdHeading(24))
                        .foregroundColor(.kdOrange)
                }
            }
        }
    }

    var headerSection: some View {
        VStack(spacing: 20) {
            Image("DIT2")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)

        }
    }

    var missionSection: some View {
        InfoCard(title: "Vårt Oppdrag") {
            Text("Damer i Toppen er en prosjektgruppe under studentorganisasjonen Springbrettet. Vårt mål er å spre kunnskap om kjønnsubalansen på toppen av næringslivet og å inspirere og engasjere jenter til å tørre å bryte gjennom glasstaket.")
                .font(.kdBody(16))
                .foregroundColor(.kdText)
                .multilineTextAlignment(.center)
        }
    }

    var visionSection: some View {
        InfoCard(title: "Vår Visjon") {
            Text("Vi jobber for å skape en fremtid der kvinner har like muligheter til å nå toppen av næringslivet som menn. Bli med oss i kampen for likestilling og bli en del av Damer i Toppen!")
                .font(.kdBody(16))
                .foregroundColor(.kdText)
                .multilineTextAlignment(.center)
        }
    }

    var socialMediaSection: some View {
        VStack(spacing: 15) {
            SocialMediaButton(
                title: "Følg oss på Facebook",
                icon: "facebook",
                url: "https://www.facebook.com/groups/928191017996338/?hoisted_section_header_type=recently_seen&multi_permalinks=1167470484068389",
                color: Color.blue
            )

            SocialMediaButton(
                title: "Følg oss på Instagram",
                icon: "instagram",
                url: "https://instagram.com/dameritoppen?igshid=MzRlODBiNWFlZA==",
                color: Color.purple
            )
        }
    }
}

struct InfoCard<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.kdHeading(24))
                .foregroundColor(.kdOrange)

            content
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.kdBackground.opacity(0.8))
        )
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

struct SocialMediaButton: View {
    let title: String
    let icon: String
    let url: String
    let color: Color

    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.kdBody(18))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(color)
            .cornerRadius(15)
        }
        .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct DiTView_Previews: PreviewProvider {
    static var previews: some View {
        DiTView()
    }
}
