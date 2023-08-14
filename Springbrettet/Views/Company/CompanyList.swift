//
//  CompanyList.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct CompanyList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText = ""
    @State private var showFavoritesOnly = false
    
    

    var filteredCompanies: [Company] {
        modelData.companies.filter { company in
            (!showFavoritesOnly || company.isFavorite) &&
            (searchText.isEmpty || company.name.localizedStandardContains(searchText))
        }
    }

    
    var body: some View {
        List {
            
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favoritter")
            }
            
            ForEach(filteredCompanies) { company in
                NavigationLink {
                    CompanyDetail(company: company)
                } label: {
                    CompanyRow(company: company)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Bedrifter")
        .searchable(text: $searchText, prompt: "Søk etter bedrift")
        .foregroundColor(Color("KDOrange"))
        
    }
}


struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
            .environmentObject(ModelData())
    }
}

