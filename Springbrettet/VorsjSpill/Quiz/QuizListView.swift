import SwiftUI

struct QuizListView: View {
    let buttonsData = [
        ("Level1.json", "Nivå 1: Vil du bli tusinær?", "💸"),
        ("Level2.json", "Nivå 2: Er du smartere enn en paradise hotel deltaker?", "🏩"),
        ("Level3.json", "Nivå 3: Er du Smartere enn en 5. klassing?", "👶🏼"),
        ("Level4.json", "Nivå 4: Superkviss på NRK super", "📺"),
    ]

    var body: some View {
        NavigationStack {
            GameListView(
                items: buttonsData,
                title: "Quiz",
                animation: .spring,
                container: .scrollView,
                header: {
                    Text("Quiz!")
                        .font(.title)
                },
                row: { item, _ in
                    let (filename, title, emoji) = item
                    NavigationLink(destination: QuizView(filename: filename, title: title)) {
                        HStack {
                            Text(emoji)
                                .font(.largeTitle)
                                .padding(.leading, 20)
                            Text(title)
                                .fontWeight(.semibold)
                                .padding(.trailing, 20)
                            Spacer()
                        }
                        .padding(.vertical, .spacingBase)
                        .background(Color.pink.opacity(0.5))
                        .cornerRadius(.radiusSmall)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            )
        }
    }
}

#Preview {
    QuizListView()
}
