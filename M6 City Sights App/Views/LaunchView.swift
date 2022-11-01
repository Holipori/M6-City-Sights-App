//
//  ContentView.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/28/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // detect the authorization status of geolocating the user
        
        
        if model.authorizationState == .notDetermined{
            
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            
            HomeView()
        }
        else {
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
