//
//  SquareImage.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI


struct SquareImage: View {

    var image: Image

    

    var body: some View {

        image
            .resizable()
            .frame(width: 250, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 7)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))

    }

}


struct SquareImage_Previews: PreviewProvider {

    static var previews: some View {

        SquareImage(image: Image("akersolutions"))

    }

}
