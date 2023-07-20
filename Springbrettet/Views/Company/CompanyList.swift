//
//  CompanyList.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct CompanyList: View {
    @State private var searchText = ""
    @State private var selectedCompany: Company? // to hold the selected company
    
    var filteredCompanies: [Company] {
        companies.filter { company in
            searchText.isEmpty || company.name.localizedStandardContains(searchText)
        }
    }

    var body: some View {
        ZStack {
            List(filteredCompanies) { company in
                Button(action: {
                    selectedCompany = company
                }) {
                    CompanyRow(company: company)
                        .background(Color.clear) // Change the background color of each row to clear
                }
            }
            .listStyle(.inset)
            .searchable(text: $searchText, prompt: "Søk etter bedrift")
            .toolbar {
                ToolbarItem {
                    HStack {
                        Image("KDLogo")
                            .resizable()
                            .scaledToFit()
                        Text("Bedrifter")
                            .font(.headline)
                        Spacer()
                    }
                }
            }
        }
        .sheet(item: $selectedCompany) { selectedCompany in
            // Provide the detail view with the selected company
            CompanyDetail(company: selectedCompany)
        }
    }
}

struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
    }
}
