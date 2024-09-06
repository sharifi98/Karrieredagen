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
        VStack(spacing: 0) {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                        .font(.kdBody(16))
                }
                .padding(5)
            }
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))

            List {
                ForEach(filteredCompanies) { company in
                    NavigationLink(destination: CompanyDetail(company: company)) {
                        CompanyRow(company: company)
                    }
                    .listRowBackground(Color.kdBackground)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Companies")
        .background(Color.kdBackground.edgesIgnoringSafeArea(.all))
        .animation(.spring(), value: filteredCompanies)
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.kdSecondary)

            TextField("Search companies", text: $text)
                .foregroundColor(.kdText)

            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.kdSecondary)
                }
            }
        }
        .padding(8)
        .background(Color.kdBackground)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.Orange, lineWidth: 1)
        )
    }
}


struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
            .environmentObject(ModelData())
    }
}

