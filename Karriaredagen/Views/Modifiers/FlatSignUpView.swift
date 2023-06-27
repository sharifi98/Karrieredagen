//
//  FlatSignUpView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 28/06/2023.
//

import SwiftUI

struct FlatSignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                Text("Sign up")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.top)
                    .foregroundColor(Color.primary.opacity(0.4))
                
                Text("Create a new account")
                    .font(.callout)
                    .frame(maxWidth : .infinity, alignment: .leading)
                
                Divider().padding()
                
                VStack (spacing: 12) {
                    
                    TextField("Enter username", text: $email)
                        .modifier(FlatGlassView())
                    
                    TextField("Enter email", text: $email)
                        .modifier(FlatGlassView())
                    
                    
                    SecureField("Enter password", text: $password)
                        .modifier(FlatGlassView())
                    
                    
                    SecureField("Re-enter password", text: $passwordAgain)
                        .modifier(FlatGlassView())
                }
                .padding()
                
                Divider().padding()
                
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    .font(.footnote)
                
                Button {
                    //TODO:- add action
                } label: {
                    ZStack {
                        Text("SIGN UP")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.thickMaterial)
                            .cornerRadius(14)
                            .padding(.bottom, 8)
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.35))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(35)
            .padding()
        } else {
            // Fallback on earlier versions
            VStack {
                
            }
        }
    }
}
struct FlatSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FlatSignUpView()
    }
}
