//
//  HundredView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 06/12/2023.
//

import SwiftUI

struct HundredView: View {
        
    var filename: String
    var title: String
    let questions: [Question]
    
    init(filename: String, title: String) {
        self.filename = filename
        self.title = title
        self.questions = load(self.filename)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView {
                    VStack {
                        // Display rule if it exists in the first question
                        if let rule = questions.first?.rule {
                            MessageBubble(text: rule, type: .rules)
                                .padding(.bottom, 10)
                        }
                        
                        ForEach(questions) { question in
                            QuestionCardView(question: question)
                        }
                    }
                }
                .background(Color.gray.opacity(0.1))  // Light gray background for contrast

                // Add the ComposeArea here at the bottom
                ComposeArea()
            }
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}





#Preview {
    HundredView(filename: "Kompliment.json", title: "50/50")
}

