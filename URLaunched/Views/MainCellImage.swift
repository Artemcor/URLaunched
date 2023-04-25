//
//  MainCellImage.swift
//  URLaunched
//
//  Created by Artem Stozhok on 25.04.2023.
//

import SwiftUI

struct MainCellImage: View {
    let vendor: Vendor
    
    var body: some View {
        AsyncImage(url: URL(string: vendor.coverPhoto.mediaURL)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.gray
        }
        .frame(height: 170)
        .cornerRadius(10)
    }
}
