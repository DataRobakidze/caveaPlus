//
//  caveaPlusApp.swift
//  caveaPlus
//
//  Created by Data on 16.01.25.
//

import SwiftUI

@main
struct caveaPlusApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .mainBackground.withAlphaComponent(0.8)// გამჭვირვალე ფონი
        appearance.shadowColor = .clear // ჩრდილის გამორთვა
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.red
    }
    
//    init() {
//        let appearance = UINavigationBarAppearance()
//        
//        // Creating a gradient background
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.mainBackground.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
//        
//        // Make sure the gradient covers the whole navigation bar
//        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100) // adjust height as needed
//        
//        // Create a UIImage from the gradient
//        let gradientImage = UIGraphicsImageRenderer(size: gradientLayer.frame.size).image { context in
//            gradientLayer.render(in: context.cgContext)
//        }
//        
//        appearance.configureWithTransparentBackground()
//        appearance.backgroundImage = gradientImage // Set gradient as background image
//        appearance.backgroundColor = .clear // Clear background to make gradient visible
//        
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    }

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
            } else {
                LogInPage()
            }
        }
    }
}


extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
