import SwiftUI

struct CVTipsView: View {
    @State private var isSheetPresented = false
    @State private var selectedCV: CVViewType?
    @State private var expandedTip: Int?

    let tips = [
        ("1. Vær tydelig og relevant", "Mange bruker veldig lite tid på både CV og søknad, og det kan føre til at man ikke skiller seg ut eller viser hva man faktisk kan bidra med i jobben. Det er viktig å være tydelig og relevant i både CV og søknad, slik at arbeidsgiveren ser hva du har å tilby."),
        ("2. Vis konkrete eksempler", "Det er viktig å vise konkrete eksempler på hva man har gjort tidligere, og hvordan dette kan være relevant for den jobben man søker på. Dette viser at du har erfaring som kan være nyttig for arbeidsgiveren."),
        ("3. Reflekter over egenskaper", "Reflekter over dine egne egenskaper og ferdigheter, og hvordan disse kan være nyttige for arbeidsgiveren. Dette vil hjelpe deg med å finne ut hva som gjør deg unik, og hvordan du kan bruke dette til din fordel når du søker på jobber."),
        ("4. Unngå vanlige feil", "Unngå vanlige feil som å skrive for mye eller for lite, ikke tilpasse søknaden til stillingen eller arbeidsgiveren, eller ikke vise entusiasme og motivasjon for jobben. Husk at en god CV og søknad kan være avgjørende for om du blir innkalt til intervju eller ikke."),
        ("5. Ha en god LinkedIn-profil", "LinkedIn er en viktig plattform for jobbsøking, og det er der mange rekrutterere befinner seg. Sørg for å ha en god LinkedIn-profil som viser dine ferdigheter og erfaringer på en tydelig måte."),
        ("6. Still spørsmål", "Still spørsmål når du søker på jobber, slik at du viser interesse og engasjement for stillingen. Dette kan også hjelpe deg med å finne ut mer om stillingen"),
        ("7. Skriv en beskrivelse", "Det kan være lurt å skrive en kort beskrivelse av deg selv ved siden av CV-en, slik at arbeidsgiveren får et inntrykk av hvem du er og hva du kan tilby. Dette kan også hjelpe deg med å skille deg ut fra andre søkere."),
        ("8. Tilpass søknaden", "Det er viktig å tilpasse søknaden til stillingen du søker på, og vise hvordan dine ferdigheter og erfaringer kan være relevante for denne spesifikke jobben. Dette viser at du har gjort research og virkelig ønsker denne jobben."),
        ("9. Vær konkret", "Vær konkret når du beskriver dine erfaringer og ferdigheter i CV-en og søknaden. Gi eksempler på hva du har gjort tidligere, og hvordan dette kan være relevant for den jobben du søker på."),
        ("10. Vis entusiasme", "Vis entusiasme og motivasjon for jobben i både CV-en og søknaden. Dette viser at du virkelig ønsker denne jobben, og at du vil gjøre ditt beste for å utføre den godt hvis du får den."),
    ]

    enum CVViewType: String, Identifiable {
        case IT, Economics, Juss, HR
        var id: String { self.rawValue }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerSection
                    cvExamplesSection
                    tipsSection
                }
                .padding(.top)
            }
            .navigationTitle("CV Tips")
        }
        .sheet(item: $selectedCV) { viewType in
            switch viewType {
            case .IT: CVITView()
            case .Economics: CVEconomicsView()
            case .Juss: CVJussView()
            case .HR: HRCVView()
            }
        }
    }

    var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Springbrettet til din drømmejobb")
                .font(.title2)
                .foregroundColor(Color("KDOrange"))
            Text("Tips og Eksempler")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("Her finner du nyttige råd og anbefalinger for å hjelpe deg med å skrive en overbevisende CV og søknad. Disse tipsene er designet for å hjelpe deg med å fremheve dine ferdigheter, erfaringer og unike kvaliteter, slik at du kan skille deg ut fra andre søkere.")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }

    var cvExamplesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                cvExampleButton(title: "IT-CV", icon: "desktopcomputer", type: .IT)
                cvExampleButton(title: "ØK-CV", icon: "chart.bar", type: .Economics)
                cvExampleButton(title: "JUS-CV", icon: "scale.3d", type: .Juss)
                cvExampleButton(title: "HR-CV", icon: "person.3", type: .HR)
            }
            .padding(.horizontal)
        }
    }

    func cvExampleButton(title: String, icon: String, type: CVViewType) -> some View {
        Button(action: {
            selectedCV = type
        }) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 30))
                Text(title)
                    .font(.caption)
            }
            .frame(width: 80, height: 80)
            .background(Color("KDOrange"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

    var tipsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            ForEach(tips.indices, id: \.self) { index in
                TipView(tip: tips[index], isExpanded: expandedTip == index) {
                    withAnimation {
                        if expandedTip == index {
                            expandedTip = nil
                        } else {
                            expandedTip = index
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct TipView: View {
    let tip: (String, String)
    let isExpanded: Bool
    let action: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: action) {
                HStack {
                    Text(tip.0)
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            if isExpanded {
                Text(tip.1)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.top, 5)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct CVTipsView_Previews: PreviewProvider {
    static var previews: some View {
        CVTipsView()
    }
}
