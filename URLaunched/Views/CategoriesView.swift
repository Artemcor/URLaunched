//
//  CategoriesView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 25.04.2023.
//

import SwiftUI

struct CategoriesView: View {
    let vendor: Vendor
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<vendor.categories.count, id: \.self) { index in
                if index % 2 == 0 {
                    HStack(spacing: -5) {
                        CategoryRowView(category: vendor.categories[index])
                        
                        if index + 1 < vendor.categories.count {
                            CategoryRowView(category: vendor.categories[index + 1])
                        }
                    }
                }
            }
        }
    }
}
