//
//  HundredView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 07/12/2023.
//

import SwiftUI

struct HundredView: View {
    let filename: String
    let title: String
    @EnvironmentObject var store: ContentStore

    private var questions: [Question] { store.corpus(filename) }

    var body: some View {
        NavigationView {
            PromptDeckView(corpus: questions, title: title, mode: .chatSwipe)
        }
    }
}

struct HundredView_Previews: PreviewProvider {
    static var previews: some View {
        HundredView(filename: "Kompliment.json", title: "Kompliment")
            .environmentObject(ContentStore())
    }
}
