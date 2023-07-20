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
                let visualEffectView   = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
                visualEffectView.frame =  nc.navigationBar.bounds

                let colorView = UIView(frame: nc.navigationBar.bounds)
                colorView.backgroundColor = UIColor(named: "KDBlue")?.withAlphaComponent(0.5)
                colorView.isUserInteractionEnabled = false
                
                visualEffectView.contentView.addSubview(colorView)
                
                nc.navigationBar.addSubview(visualEffectView)
                nc.navigationBar.sendSubviewToBack(visualEffectView)
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
