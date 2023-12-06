//
//  CustomToggleStyle.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 06/12/2023.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .yellow : .gray)
            }
        }
    }
}


struct CustomToggleStyle_Previews: PreviewProvider {
    @State static var isOn = false

    static var previews: some View {
        Toggle("Sample Toggle", isOn: $isOn)
            .toggleStyle(CustomToggleStyle())
            .padding()
    }
}
