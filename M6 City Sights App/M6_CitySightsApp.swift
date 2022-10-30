//
//  M6_City_Sights_AppApp.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/28/22.
//

import SwiftUI

@main
struct M6_CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView().environmentObject(ContentModel())
        }
    }
}
