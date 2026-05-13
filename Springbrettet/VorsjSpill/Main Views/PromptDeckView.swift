import SwiftUI

struct PromptDeckView: View {
    let corpus: [Question]
    let title: String
    let mode: DeckMode

    enum DeckMode {
        case chatSwipe  // user-toggleable chat and swipe
        case chat       // chat only, no mode picker
    }

    private enum ViewMode: String, CaseIterable {
        case chat = "Chat"
        case swipe = "Swipe"
    }

    @State private var selectedViewMode: ViewMode = .chat
    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 0) {
            if mode == .chatSwipe {
                Picker("Mode", selection: $selectedViewMode) {
                    ForEach(ViewMode.allCases, id: \.self) { m in
                        Text(m.rawValue).tag(m)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }

            if selectedViewMode == .chat || mode == .chat {
                chatView
            } else {
                swipeView
            }

            ComposeArea()
            ChatsTabBarView()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemBackground))
    }

    private var chatView: some View {
        ScrollView {
            VStack(spacing: 12) {
                if let rule = corpus.first?.rule {
                    MessageBubble(text: rule, type: .rules)
                        .padding(.bottom, 10)
                }
                ForEach(Array(corpus.enumerated()), id: \.element.id) { index, question in
                    let bubbleType: MessageBubble.MessageType = index % 2 == 0 ? .incoming : .outgoing
                    MessageBubble(text: "\(question.id). \(question.question)", type: bubbleType)
                        .id(question.id)
                }
            }
            .padding()
        }
    }

    private var swipeView: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<corpus.count, id: \.self) { index in
                VStack {
                    Spacer()
                    MessageBubble(text: "\(corpus[index].id). \(corpus[index].question)", type: .incoming)
                        .padding()
                    Spacer()
                }
                .tag(index)
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    NavigationView {
        PromptDeckView(
            corpus: [Question(id: 1, question: "Test question", rule: nil, isChecked: nil)],
            title: "Preview",
            mode: .chatSwipe
        )
    }
}
