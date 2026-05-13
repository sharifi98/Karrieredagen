import SwiftUI

struct JegHarAldriListView: View {
    let buttonsData: [(filename: String, title: String, emoji: String)] = [
        ("JegHarAldriVolume1.json", "Volume 1", "🍺"),
        ("JegHarAldriVolume2.json", "Volume 2", "🍻"),
        ("JegHarAldriVolume3.json", "Volume 3", "🥃"),
        ("JegHarAldriVolume4.json", "Volume 4", "🎊"),
        ("JegHarAldriVolume5.json", "Volume 5", "⭐️"),
        ("JegHarAldriS3XEdition.json", "S3X Edition", "🔥"),
    ]

    var body: some View {
        NavigationStack {
            GameListView(items: buttonsData, title: "Jeg har aldri") { item, _ in
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

#Preview {
    JegHarAldriListView()
}
