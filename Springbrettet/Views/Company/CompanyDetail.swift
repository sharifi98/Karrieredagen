//
//  CompanyDetail.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

import MapKit

import SDWebImageSwiftUI


struct CompanyDetail: View {

    @EnvironmentObject var store: ContentStore

    var company: Company

    private var favoriteBinding: Binding<Bool> {
        Binding(
            get: { store.companies.first { $0.id == company.id }?.isFavorite ?? false },
            set: { _ in store.toggleFavorite(companyID: company.id) }
        )
    }

    var body: some View {

        ScrollView {
            VStack(spacing: 0) {
                MapView(coordinate: company.locationCoordinate)
                    .frame(height: 300)

                SquareImage(image: company.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(company.name)
                            .font(.title)
                            .foregroundColor(Color("KDOrange"))
                        FavoriteButton(isSet: favoriteBinding)
                    }
                    
                    HStack {
                        Text(company.industry)
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    
                    Divider()
                                        
                    Text("Info")
                        .font(.title)
                        .foregroundColor(Color("KDOrange"))
                    Text(company.description)
                    
                }
                .padding()
            }
            
        }
        .navigationTitle(company.name)
        .navigationBarTitleDisplayMode(.inline)
        .transition(.move(edge: .trailing))
    }
    
}


struct CompanyDetail_Previews: PreviewProvider {
    static let store = ContentStore()

    static var previews: some View {
        CompanyDetail(company: store.companies[0])
            .environmentObject(store)
    }
}
