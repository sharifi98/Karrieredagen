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
                .frame(width: 50, height: 50)
            VStack {
                Text(company.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            if company.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Spacer()
        }
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
