//
//  CompanyList.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct CompanyList: View {
    @State private var searchText = ""
    var filteredCompanies: [Company] {
        companies.filter { company in
            searchText.isEmpty || company.name.localizedStandardContains(searchText)
        }
        
    }
    
    
    var body: some View {
        
        NavigationStack {
            List(filteredCompanies) { company in
                NavigationLink {
                    CompanyDetail(company: company)
                } label: {
                    CompanyRow(company: company)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Bedrifter")
            .searchable(text: $searchText, prompt: "Søk etter bedrift")
            .background(Color.blue) // Add this line to change the background color
            .toolbarBackground(
                Color.orange,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        
    }
}

struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
    }
}
