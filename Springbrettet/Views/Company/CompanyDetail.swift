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
    
    @EnvironmentObject var modelData: ModelData
    
    var company: Company
    
    var companyIndex: Int {
        modelData.companies.firstIndex(where: {$0.id == company.id})!
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
                        FavoriteButton(isSet: $modelData.companies[companyIndex].isFavorite)
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
    static let modelData = ModelData()
    
    static var previews: some View {
        CompanyDetail(company: ModelData().companies[0])
            .environmentObject(modelData)
        
    }
    
}
