//
//  StartNachet.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/09/2023.
//

import SwiftUI

struct StartNachet: View {
    let filename: String
    let title: String
    @EnvironmentObject var store: ContentStore

    private var questions: [Question] { store.corpus(filename) }

    var body: some View {
        PromptDeckView(corpus: questions, title: title, mode: .chat)
    }
}

struct StartNachet_Previews: PreviewProvider {
    static var previews: some View {
        StartNachet(filename: "startnachet.json", title: "Start Nachet")
            .environmentObject(ContentStore())
    }
}
