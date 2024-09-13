//
//  HundredView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 07/12/2023.
//

import SwiftUI

struct HundredView: View {

    var filename: String
    var title: String
    let questions: [Question]
    @State private var currentQuestionIndex = 0
    @State private var selectedMode: ViewMode = .chat

    enum ViewMode: String, CaseIterable {
        case chat = "Chat"
        case swipe = "Swipe"
    }

    init(filename: String, title: String) {
        self.filename = filename
        self.title = title
        self.questions = loadGame(self.filename)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                modePicker

                if selectedMode == .chat {
                    chatView
                } else {
                    swipeView
                }

                ComposeArea()
                ChatsTabBarView()
            }
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemBackground))
        }
    }

    // MARK: - Mode Picker

    private var modePicker: some View {
        Picker("Mode", selection: $selectedMode) {
            ForEach(ViewMode.allCases, id: \.self) { mode in
                Text(mode.rawValue).tag(mode)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }

    // MARK: - Chat View

    private var chatView: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView {
                VStack(spacing: 12) {
                    ruleView
                    questionsView
                }
                .padding()
            }
        }
    }

    private var ruleView: some View {
        Group {
            if let rule = questions.first?.rule {
                MessageBubble(text: rule, type: .rules)
                    .padding(.bottom, 10)
            }
        }
    }

    private var questionsView: some View {
        ForEach(Array(questions.enumerated()), id: \.element.id) { index, question in
            let messageType: MessageBubble.MessageType = index % 2 == 0 ? .incoming : .outgoing
            MessageBubble(text: "\(question.id). \(question.question)", type: messageType)
                .id(question.id)
        }
    }

    // MARK: - Swipe View

    private var swipeView: some View {
        TabView(selection: $currentQuestionIndex) {
            ForEach(0..<questions.count, id: \.self) { index in
                VStack {
                    Spacer()
                    MessageBubble(text: "\(questions[index].id). \(questions[index].question)", type: .incoming)
                        .padding()
                    Spacer()

                }
                .tag(index)
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }

    // MARK: - Swipe Actions

    private func swipeLeft() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }

    private func swipeRight() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }
}

struct HundredView_Previews: PreviewProvider {
    static var previews: some View {
        HundredView(filename: "Kompliment.json", title: "Kompliment")
    }
}
