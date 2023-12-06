//
//  QuestionCardView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 06/12/2023.
//

import SwiftUI

struct QuestionCardView: View {
    var question: Question

    var body: some View {
        VStack {
            MessageBubble(text: "\(question.id)", type: .incoming)
            MessageBubble(text: question.question, type: .outgoing)
        }
        .padding([.horizontal, .top], 10)
    }
}





#Preview {
    Group {
        QuestionCardView(question: Question(id: 1, question: "Sample Question for Preview"))
        // Using a dark background for better visibility in the preview
        QuestionCardView(question: Question(id: 1, question: "Sample Question for Preview"))
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}

