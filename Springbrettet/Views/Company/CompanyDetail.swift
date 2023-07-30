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
    
    var company: Company
    
    var body: some View {
        ScrollView {
            MapView(coordinate: company.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            SquareImage(image: company.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(company.name)
                    .font(.system(size: 30))
                    .foregroundColor(Color("KDOrange"))
                
                HStack {
                    Text("Stand \(company.standNumber)")
                    Spacer()
                    Text(company.industry)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                Divider()
                Text("Info")
                    .font(.system(size: 25))
                    .foregroundColor(Color("KDOrange"))

                Text(company.description)
                
            }
            .padding()
            
        }
        .navigationTitle(company.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CompanyDetail_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDetail(company: companies[0])
    }
}




