//
//  HundredQuestionsListView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 07/12/2023.
//

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
                            .easeOut(duration: 0.5)
                                .delay(0.05 * Double(index)),
                            value: animateList
                        )
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                animateList = true
            }
            .navigationTitle("100 Spørsmål")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}
