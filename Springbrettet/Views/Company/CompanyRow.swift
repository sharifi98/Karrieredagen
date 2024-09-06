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
        HStack(spacing: 16) {
            company.image
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 4) {
                Text(company.name)
                    .font(.kdHeading(18))
                    .foregroundColor(.kdText)

                Text(company.industry)
                    .font(.kdBody(14))
                    .foregroundColor(.kdSecondary)
            }

            Spacer()

            if company.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 8)
    }
}

struct CompanyRow_Previews: PreviewProvider {
    
    static var companies = ModelData().companies
    
    static var previews: some View {
        Group {
            CompanyRow(company: companies[0])
            
        }
        
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
