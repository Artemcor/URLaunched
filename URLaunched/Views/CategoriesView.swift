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
                        Label {
                            Text(vendor.categories[index].name)
                                .offset(CGSize(width: -15, height: 0))
                        } icon: {
                            SVGKFastImageViewSUI(url: URL(string: vendor.categories[index].image.mediaURL)!, size: CGSize(width: 20,height: 20))
                                .frame(width: 20, height: 20)
                        }
                        
                        if index + 1 < vendor.categories.count {
                            Label {
                                Text(vendor.categories[index + 1].name)
                                    .offset(CGSize(width: -15, height: 0))
                            } icon: {
                                SVGKFastImageViewSUI(url: URL(string: vendor.categories[index + 1].image.mediaURL)!, size: CGSize(width: 20,height: 20))
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
            }
        }
    }
}

