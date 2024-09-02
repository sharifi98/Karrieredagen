import SwiftUI

struct KaraokeView: View {
    let songs: [Song]
    var filename: String
    var title: String
    var url: String

    init(filename: String, title: String, url: String) {
        self.filename = filename
        self.title = title
        self.songs = loadGame(self.filename)
        self.url = url
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(spacing: 20) {
                        spotifyButton

                        ForEach(0..<songs.count, id: \.self) { index in
                            let song = songs[index]
                            SongCard(song: song, index: index)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.black.opacity(0.8), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }

    var spotifyButton: some View {
        Link(destination: URL(string: url)!) {
            HStack {
                Text("PLAY ON SPOTIFY")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                Image(systemName: "play.fill")
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.green)
            .cornerRadius(20)
        }
        .padding(.vertical, 20)
    }
}

struct SongCard: View {
    let song: Song
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("\(song.hvem)")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)

            Text(song.sangtekst)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .lineSpacing(8)
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

struct KaraokeView_Previews: PreviewProvider {
    static var previews: some View {
        KaraokeView(filename: "vivalavida.json", title: "Livin on a Prayer - Bon Jovi", url: "https://open.spotify.com/track/37ZJ0p5Jm13JPevGcx4SkF?si=3ee9c7113cc04e61")
    }
}
