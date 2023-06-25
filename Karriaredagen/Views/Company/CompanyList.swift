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
                        .background(Color.clear) // Change the background color of each row to clear
                }
            }
            .listStyle(.inset)
            .searchable(text: $searchText, prompt: "Søk etter bedrift")
            .toolbar {
                ToolbarItem {
                    HStack {
                        Image("SB")
                            .resizable()
                            .scaledToFit()
                        Text("Bedrifter")
                            .font(.headline)
                        
                        Spacer()
                    }
                }
            }
        }
        
    }
    
}

struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
    }
}
