//
//  BusinessSectionHeader.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/31/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
        }
    }
}

//struct BusinessSectionHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessSectionHeader()
//    }
//}
