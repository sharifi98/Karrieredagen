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
            MedDrikkeView()
        case .utenDrikke:
            UtenDrikkeView()
        }
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


// MARK: - Shared Models and Components

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let destinationView: AnyView
    let image: Image
}

struct ItemRowView: View {
    let item: Item

    var body: some View {
        HStack(spacing: 16) {
            item.image
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.blue, lineWidth: 2)
                )
                .shadow(radius: 3)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

// MARK: - Med Drikke View

struct MedDrikkeView: View {
    @State private var searchText = ""

    let items = [
        Item(title: "100 spørsmål", subtitle: "Snusboks leken, Volume 1-7 og mer", destinationView: AnyView(HundredQuestionsListView()), image: Image("trym")),
        Item(title: "Chugg eller sannhet", subtitle: "Volume 1-3", destinationView: AnyView(ChuggEllerSannhetListView()), image: Image("chugg")),
        Item(title: "Jeg har aldri", subtitle: "Volume 1-9", destinationView: AnyView(JegHarAldriListView()), image: Image("mats")),
        Item(title: "Karaoke", subtitle: "Sett en av sangene på, følg teksten og syng når det gjeld...", destinationView: AnyView(KaraokeListView()), image: Image("pimp")),
        Item(title: "Start Nachet", subtitle: "Få i gang nachet!", destinationView: AnyView(StartNachet(filename: "startnachet.json", title: "Start Nachet")), image: Image("anders")),
        Item(title: "Hotseat", subtitle: "", destinationView: AnyView(Hotseat()), image: Image("morkenhotseat"))
    ]

    var body: some View {
        List {
            ForEach(filteredItems) { item in
                NavigationLink(destination: item.destinationView) {
                    ItemRowView(item: item)
                }
            }
        }
        .listStyle(PlainListStyle())
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }

    var filteredItems: [Item] {
        items.filter { item in
            searchText.isEmpty || item.title.lowercased().contains(searchText.lowercased())
        }
    }
}

// MARK: - Uten Drikke View

struct UtenDrikkeView: View {
    @State private var searchText = ""

    let items = [
        Item(title: "Quiz", subtitle: "Quiz 1-10", destinationView: AnyView(QuizListView()), image: Image("trym"))
    ]

    var body: some View {
        List {
            ForEach(filteredItems) { item in
                NavigationLink(destination: item.destinationView) {
                    ItemRowView(item: item)
                }
            }
        }
        .listStyle(PlainListStyle())
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }

    var filteredItems: [Item] {
        items.filter { item in
            searchText.isEmpty || item.title.lowercased().contains(searchText.lowercased())
        }
    }
}

// MARK: - Preview

struct VorsjContentView_Previews: PreviewProvider {
    static var previews: some View {
        VorsjContentView()
    }
}
