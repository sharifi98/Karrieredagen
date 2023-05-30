//
//  CompanyRow.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct CompanyRow: View {
    var company: Company
    var body: some View {
        HStack {
            company.image
                .resizable()
                .clipShape(Rectangle())
                //.overlay(Rectangle().stroke(.gray, lineWidth: 2))
                .frame(width: 50, height: 50)
            Text(company.name)
            Spacer()
        }
    }
}

struct CompanyRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompanyRow(company: companies[0])

        }

        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
