import Foundation

final class ContentStore: ObservableObject {
    @Published private(set) var companies: [Company]
    let events: [Event]
    let leaders: [Leder]
    let springbrettere: [Person]

    private let bundle: Bundle
    private var dataCache: [String: Data] = [:]

    init(bundle: Bundle = .main) {
        self.bundle = bundle
        companies = Self.load("companyData.json", from: bundle)
        events = Self.load("scheduleData.json", from: bundle)
        leaders = Self.load("lederData.json", from: bundle)
        springbrettere = Self.load("springbrettereData.json", from: bundle)
    }

    func toggleFavorite(companyID: Int) {
        guard let index = companies.firstIndex(where: { $0.id == companyID }) else { return }
        companies[index].isFavorite.toggle()
    }

    func corpus<T: Decodable>(_ filename: String) -> T {
        let data: Data
        if let cached = dataCache[filename] {
            data = cached
        } else {
            data = Self.loadData(filename, from: bundle)
            dataCache[filename] = data
        }
        return Self.decode(data: data, filename: filename)
    }

    private static func loadData(_ filename: String, from bundle: Bundle) -> Data {
        guard let url = bundle.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load \(filename) from bundle.")
        }
        return data
    }

    private static func load<T: Decodable>(_ filename: String, from bundle: Bundle) -> T {
        decode(data: loadData(filename, from: bundle), filename: filename)
    }

    private static func decode<T: Decodable>(data: Data, filename: String) -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

// Backward-compatible loader for VorsjSpill game views that decode in init.
// Migrating these views to ContentStore.corpus() is deferred to the PromptDeck
// deepening pass (candidate 3 in the architecture backlog).
func loadGame<T: Decodable>(_ filename: String) -> T {
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in bundle.")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Couldn't load \(filename) from bundle.")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
