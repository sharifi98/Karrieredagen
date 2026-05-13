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

    @State private var animateList = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(buttonsData.indices, id: \.self) { index in
                    let item = buttonsData[index]
                    NavigationLink(destination: HundredView(filename: item.filename, title: item.title)) {
                        HStack(spacing: 16) {
                            Text(item.emoji)
                                .font(.largeTitle)
                                .frame(width: 50, height: 50)
                                .background(Color.blue.opacity(0.1))
                                .clipShape(Circle())
                            Text(item.title)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .opacity(animateList ? 1 : 0)
                        .offset(y: animateList ? 0 : 20)
                        .animation(
                            .easeOut(duration: 0.5).delay(0.05 * Double(index)),
                            value: animateList
                        )
                    }
                }
            }
            .listStyle(.plain)
            .onAppear { animateList = true }
            .navigationTitle("Jeg har aldri")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    JegHarAldriListView()
}
