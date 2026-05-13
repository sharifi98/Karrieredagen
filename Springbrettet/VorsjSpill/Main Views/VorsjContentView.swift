import SwiftUI

// MARK: - Main Content View

struct VorsjContentView: View {
    enum ViewChoice: String, CaseIterable {
        case medDrikke = "Med drikke"
        case utenDrikke = "Uten drikke"
    }

    @State private var showWelcomeSheet = false
    @State private var selectedView = ViewChoice.medDrikke

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Picker("Velg type lek", selection: $selectedView) {
                    ForEach(ViewChoice.allCases, id: \.self) { choice in
                        Text(choice.rawValue).tag(choice)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                selectedContentView
            }
            .navigationTitle("Vorsj-spill")
            .toolbar(.hidden, for: .tabBar)
        }
        .onAppear(perform: checkFirstLaunch)
        .sheet(isPresented: $showWelcomeSheet) {
            VorsjWelcomeSheet(onDismiss: dismissWelcomeSheet)
        }
    }

    @ViewBuilder
    private var selectedContentView: some View {
        switch selectedView {
        case .medDrikke:
            GameCatalogView(entries: medDrikkeEntries)
        case .utenDrikke:
            GameCatalogView(entries: utenDrikkeEntries)
        }
    }

    private var medDrikkeEntries: [CatalogEntry] {
        [
            CatalogEntry(title: "100 spørsmål", subtitle: "Snusboks leken, Volume 1-7 og mer", image: Image("trym")) {
                HundredQuestionsListView()
            },
            CatalogEntry(title: "Chugg eller sannhet", subtitle: "Volume 1-3", image: Image("chugg")) {
                ChuggEllerSannhetListView()
            },
            CatalogEntry(title: "Jeg har aldri", subtitle: "Volume 1-9", image: Image("mats")) {
                JegHarAldriListView()
            },
            CatalogEntry(title: "Karaoke", subtitle: "Sett en av sangene på, følg teksten og syng når det gjeld...", image: Image("pimp")) {
                KaraokeListView()
            },
            CatalogEntry(title: "Start Nachet", subtitle: "Få i gang nachet!", image: Image("anders")) {
                StartNachet(filename: "startnachet.json", title: "Start Nachet")
            },
            CatalogEntry(title: "Hotseat", subtitle: "", image: Image("morkenhotseat")) {
                Hotseat()
            },
        ]
    }

    private var utenDrikkeEntries: [CatalogEntry] {
        [
            CatalogEntry(title: "Quiz", subtitle: "Quiz 1-10", image: Image("trym")) {
                QuizListView()
            },
        ]
    }

    private func checkFirstLaunch() {
        if !UserDefaults.standard.bool(forKey: "VSappOpenedBefore") {
            showWelcomeSheet = true
        }
    }

    private func dismissWelcomeSheet() {
        UserDefaults.standard.set(true, forKey: "VSappOpenedBefore")
        showWelcomeSheet = false
    }
}

// MARK: - CatalogEntry

struct CatalogEntry: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: Image
    let destination: AnyView

    init<V: View>(
        title: String,
        subtitle: String,
        image: Image,
        @ViewBuilder destination: () -> V
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.destination = AnyView(destination())
    }
}

// MARK: - CatalogRowView

struct CatalogRowView: View {
    let entry: CatalogEntry

    var body: some View {
        HStack(spacing: 16) {
            entry.image
                .resizable()
                .scaledToFill()
                .frame(width: .sizeAvatar, height: .sizeAvatar)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                .shadow(radius: 3)

            VStack(alignment: .leading, spacing: 4) {
                Text(entry.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(entry.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

// MARK: - GameCatalogView

struct GameCatalogView: View {
    let entries: [CatalogEntry]
    @State private var searchText = ""

    private var filteredEntries: [CatalogEntry] {
        searchText.isEmpty ? entries : entries.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        List {
            ForEach(filteredEntries) { entry in
                NavigationLink(destination: entry.destination) {
                    CatalogRowView(entry: entry)
                }
            }
        }
        .listStyle(PlainListStyle())
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

// MARK: - Preview

struct VorsjContentView_Previews: PreviewProvider {
    static var previews: some View {
        VorsjContentView()
    }
}
