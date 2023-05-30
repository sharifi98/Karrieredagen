//
//  CompanyList.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct CompanyList: View {
    var body: some View {
        
        NavigationView {
            List(companies) { company in
                NavigationLink {
                    CompanyDetail(company: company)
                } label: {
                    CompanyRow(company: company)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Bedrifter")
        }
    }
}

struct CompanyList_Previews: PreviewProvider {
    static var previews: some View {
        CompanyList()
    }
}
