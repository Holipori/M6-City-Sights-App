//
//  HomeView.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/31/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapshowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 && model.sights.count != 0 {
            // Determine if we should show list or map
            
            if !isMapshowing {
                // show list
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "location")
                        Text("San Franxisco")
                        Spacer()
                        Text("Switch to map view")
                    }
                    Divider()
                    BusinessList()
                }
                
            }
            else {
                
            }
            
        }
        else {
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
