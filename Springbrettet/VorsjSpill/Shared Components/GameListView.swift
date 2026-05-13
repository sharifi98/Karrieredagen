import SwiftUI

enum GameListAnimation {
    case easeOut
    case spring
}

enum GameListContainer {
    case list
    case scrollView
}

struct GameListView<Item, Row: View>: View {
    let items: [Item]
    let title: String
    let animation: GameListAnimation
    let container: GameListContainer
    let headerContent: AnyView?
    @ViewBuilder let row: (Item, Int) -> Row

    init(
        items: [Item],
        title: String,
        animation: GameListAnimation = .easeOut,
        container: GameListContainer = .list,
        @ViewBuilder row: @escaping (Item, Int) -> Row
    ) {
        self.items = items
        self.title = title
        self.animation = animation
        self.container = container
        self.headerContent = nil
        self.row = row
    }

    init<H: View>(
        items: [Item],
        title: String,
        animation: GameListAnimation = .easeOut,
        container: GameListContainer = .list,
        @ViewBuilder header: () -> H,
        @ViewBuilder row: @escaping (Item, Int) -> Row
    ) {
        self.items = items
        self.title = title
        self.animation = animation
        self.container = container
        self.headerContent = AnyView(header())
        self.row = row
    }

    @State private var animate = false

    var body: some View {
        Group {
            switch container {
            case .list:
                List {
                    ForEach(items.indices, id: \.self) { index in
                        row(items[index], index)
                            .modifier(StaggerModifier(animate: animate, index: index, animationType: animation))
                    }
                }
                .listStyle(.plain)
                .onAppear { animate = true }

            case .scrollView:
                ScrollView {
                    if let headerContent {
                        headerContent
                    }
                    LazyVStack {
                        ForEach(items.indices, id: \.self) { index in
                            row(items[index], index)
                                .modifier(StaggerModifier(animate: animate, index: index, animationType: animation))
                                .onAppear {
                                    if !animate { animate = true }
                                }
                        }
                    }
                }
                .onAppear { animate = true }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct StaggerModifier: ViewModifier {
    let animate: Bool
    let index: Int
    let animationType: GameListAnimation

    func body(content: Content) -> some View {
        switch animationType {
        case .easeOut:
            content
                .opacity(animate ? 1 : 0)
                .offset(y: animate ? 0 : 20)
                .animation(
                    .easeOut(duration: 0.5).delay(0.05 * Double(index)),
                    value: animate
                )
        case .spring:
            content
                .opacity(animate ? 1 : 0)
                .offset(y: animate ? 0 : 50)
                .animation(
                    .spring().delay(0.05 * Double(index)),
                    value: animate
                )
        }
    }
}
