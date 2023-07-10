//
//  CustomNavigationBar.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 25/06/2023.
//


import SwiftUI

struct CustomNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
            .navigationBarItems(leading: EmptyView())
            .background(NavigationConfigurator { nc in
                nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
                nc.navigationBar.shadowImage = UIImage()
                nc.navigationBar.barStyle = .black // This makes the bar content white on a dark background
            })
            .preferredColorScheme(.dark) // This forces the view to use the dark color scheme
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

extension View {
    func navigationBarWithTransparentBackground() -> some View {
        self.modifier(CustomNavigationBar())
    }
}
