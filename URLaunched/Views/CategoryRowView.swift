//
//  CategoryRow.swift
//  URLaunched
//
//  Created by Artem Stozhok on 26.04.2023.
//

import SwiftUI

struct CategoryRowView: View {
    let category: Category
    
    var body: some View {
        Label {
            Text(category.name)
                .offset(CGSize(width: -15, height: 0))
                .font(.custom("OpenSans-Regular", size: 14, relativeTo: .body))
                .foregroundColor(Color("gray_primary"))
        } icon: {
            SVGKFastImageViewSUI(url: URL(string: category.image.mediaURL)!, size: CGSize(width: 20,height: 20))
                .frame(width: 20, height: 20)
                .offset(CGSize(width: -5, height: 0))
        }
    }
}
