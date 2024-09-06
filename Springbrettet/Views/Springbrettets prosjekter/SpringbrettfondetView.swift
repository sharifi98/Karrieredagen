import SwiftUI

struct SpringbrettfondetView: View {
    let imageNames = [
        "Screenshot 2023-07-05 at 15-56-54 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-57-16 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-57-32 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-57-50 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-58-05 Springbrettfondet — Springbrettet"
    ]

    var body: some View {
        ZStack {
            BackgroundSB()
            ScrollView {
                VStack(spacing: 40) {
                    whatIsSection
                    whoCanApplySection
                    applicationInfoSection
                    supportedInitiativesSection
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Springbrettfondet")
                    .font(.kdHeading(24))
                    .foregroundColor(.Orange)
            }
        }
    }

    var whatIsSection: some View {
        InfoSection(title: "Hva er Springbrettfondet?") {
            Text("Springbrettfondet er en utvidelse av Springbrettets innsats for å bygge broer mellom studenter og næringslivet på Vestlandet. Fondet tilbyr nå økonomisk støtte til studenter og studentgrupper for initiativer som støtter vår organisasjonsfilosofi og forbedrer studentenes engasjement.")
                .font(.kdBody(16))
                .foregroundColor(.kdText)
        }
    }

    var whoCanApplySection: some View {
        InfoSection(title: "Hvem kan søke støtte?") {
            VStack(alignment: .leading, spacing: 15) {
                Text("Økonomisk støtte kan søkes av enhver student eller studentgruppe, men visse kriterier må oppfylles:")
                    .font(.kdBody(16))
                    .foregroundColor(.kdText)

                BulletPoint("Tiltaket må fremme samarbeid mellom arbeidslivet og studentene")
                BulletPoint("Det må være behov for økonomisk støtte for gjennomføring")
                BulletPoint("Det er en øvre grense for støtte per semester")

                LinkButton(title: "Krav og retningslinjer", icon: "doc.text", url: "https://springbrettet.org/vedtekterspringbrettfondet")
            }
        }
    }

    var applicationInfoSection: some View {
        InfoSection(title: "Søknadsprosess") {
            VStack(alignment: .leading, spacing: 15) {
                Text("Søknader til Springbrettfondet leveres via lenken nedenfor. Vi vil vurdere din søknad og kontakte deg om utfallet.")
                    .font(.kdBody(16))
                    .foregroundColor(.kdText)

                HStack {
                    VStack(alignment: .leading) {
                        DateItem(date: "1. oktober", description: "Frist høstsemester")
                        DateItem(date: "1. mars", description: "Frist vårsemester")
                    }
                }
                .padding()
                .background(Color.kdBackground.opacity(0.6))
                .cornerRadius(10)

                LinkButton(title: "Søknadsskjema", icon: "pencil", url: "https://forms.gle/7knVYGPF7Ehh3RCUA", color: .green)
            }
        }
    }

    var supportedInitiativesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Støttede initiativer")
                .font(.kdHeading(24))
                .foregroundColor(.kdOrange)

            ExampleInitiativeView(
                title: "Norsk Akuttmedisinsk Studentforum",
                year: "2023",
                imageNames: Array(imageNames.prefix(2))
            )

            ExampleInitiativeView(
                title: "Sampolkonferansen",
                year: "2021",
                imageNames: Array(imageNames.suffix(3))
            )
        }
    }
}

struct InfoSection<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
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

struct BulletPoint: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        HStack(alignment: .top) {
            Text("•")
                .font(.kdBody(16))
                .foregroundColor(.kdOrange)
            Text(text)
                .font(.kdBody(16))
                .foregroundColor(.kdText)
        }
    }
}

struct DateItem: View {
    let date: String
    let description: String

    var body: some View {
        HStack {
            Text(date)
                .font(.kdHeading(16))
                .foregroundColor(.kdOrange)
            Text(description)
                .font(.kdBody(16))
                .foregroundColor(.kdText)
        }
    }
}

struct LinkButton: View {
    let title: String
    let icon: String
    let url: String
    var color: Color = .kdOrange

    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .font(.kdBody(16))
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(color)
            .cornerRadius(10)
        }
    }
}

struct ExampleInitiativeView: View {
    let title: String
    let year: String
    let imageNames: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.kdHeading(20))
                .foregroundColor(.kdText)

            Text(year)
                .font(.kdBody(16))
                .foregroundColor(.kdSecondary)

            TabView {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .frame(height: 275)
            .cornerRadius(20)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.kdBackground.opacity(0.8))
        )
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

struct SpringbrettfondetView_Previews: PreviewProvider {
    static var previews: some View {
        SpringbrettfondetView()
    }
}
