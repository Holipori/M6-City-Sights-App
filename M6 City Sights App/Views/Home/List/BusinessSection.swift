//
//  BusinessSection.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/31/22.
//

import SwiftUI

struct BusinessSection: View {
    
    var title:String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title)){
            Text("testing:\(businesses[0].name ?? "no")")
            ForEach(businesses){ business in
                
                Text(business.name ?? "")
                Divider()
                
            }
        }
    }
}

