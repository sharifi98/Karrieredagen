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
            
            VStack(spacing: 0) {
                
                MapView(coordinate: company.locationCoordinate)
                
                    .frame(height: 300)
                
                
                
                SquareImage(image: company.image)
                
                    .offset(y: -130)
                
                    .padding(.bottom, -130)
                
                
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(company.name)
                    
                        .font(.title)
                    
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
                    
                        .font(.title)
                    
                        .foregroundColor(Color("KDOrange"))
                    
                    
                    
                    Text(company.description)
                    
                }
                
                .padding()
                
            }
            
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
