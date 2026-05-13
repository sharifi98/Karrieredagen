import SwiftUI

struct HundredQuestionsListView: View {
    let buttonsData: [(filename: String, title: String, emoji: String)] = [
        ("5050.json", "50/50", "%"),
        ("Kompliment.json", "Kompliment", "💕"),
        ("Volume1.json", "Volume 1", "⭐️"),
        ("Volume2.json", "Volume 2", "💫"),
        ("Volume3.json", "Volume 3", "🎊"),
        ("Volume4.json", "Volume 4 (DRØY)", "🍺"),
        ("Volume41.json", "Volume 4.1 (DRØY)", "🍻"),
        ("Volume5BI.json", "Volume 5 (BI)", "🎓"),
        ("Volume6.json", "Volume 69 (Sambucas)", "🥃"),
        ("Volume7.json", "Volume 7", "👽"),
        ("Volume9.json", "Volume 8 (Beef edition)", "🥩"),
    ]

    var body: some View {
        NavigationStack {
            GameListView(items: buttonsData, title: "100 Spørsmål") { item, _ in
                NavigationLink(destination: HundredView(filename: item.filename, title: item.title)) {
                    HStack(spacing: 16) {
                        Text(item.emoji)
                            .font(.largeTitle)
                            .frame(width: .sizeAvatar, height: .sizeAvatar)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(Circle())
                        Text(item.title)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}
