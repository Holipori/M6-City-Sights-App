//
//  BusinessList.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/31/22.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack( alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "restaurants", businesses: model.restaurants)
                BusinessSection(title: "Sights", businesses: model.sights)
            }
        }
        
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
