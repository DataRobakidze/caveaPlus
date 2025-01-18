//
//  caveaPlusApp.swift
//  caveaPlus
//
//  Created by Data on 16.01.25.
//

import SwiftUI

@main
struct caveaPlusApp: App {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor(named: "MainBackgroundColor")
        
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "TabViewBack")
//        UISegmentedControl.appearance().tintColor = UIColor(named: "accentColor")
    }
    
    var body: some Scene {
        WindowGroup {
            LogInPage()
        }
    }
}
