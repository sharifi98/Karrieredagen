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
        NavigationView {
            List(filteredCompanies) { company in
                NavigationLink {
                    CompanyDetail(company: company)
                } label: {
                    CompanyRow(company: company)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Bedrifter")
            .searchable(text: $searchText, prompt: "Søk etter bedrift")
            .foregroundColor(Color("KDOrange"))
        }
    }
}

struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
    }
}

