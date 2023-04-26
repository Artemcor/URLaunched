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
        .overlay(alignment: .topTrailing) {
            Image(systemName: vendor.favorited ? "bookmark.fill" : "bookmark")
                .padding(10)
                .foregroundColor(vendor.favorited ? .white : .green)
                .background(Circle()
                    .foregroundColor(vendor.favorited ? .green : .white))
                .padding(.top, 10)
                .padding(.trailing, 10)
        }
        .overlay(alignment: .bottomLeading) {
            Text(vendor.areaServed)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .foregroundColor(.gray)
                .background(Capsule()
                    .foregroundColor(.white.opacity(0.9))
                )
                .padding(.bottom, 8)
                .padding(.leading, 8)
        }
    }
}

struct MainCellImage_Previews: PreviewProvider {
    
    static var previews: some View {
        MainCellImage(vendor: Vendor(id: 99,
                                     companyName: "Florists + Fashion",
                                     areaServed: "Newry",
                                     shopType: "Bike Shop",
                                     favorited: false,
                                     follow: false,
                                     businessType: "virtual",
                                     coverPhoto: CoverPhoto(id: 984,
                                                            mediaURL: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9",
                                                            mediaType: "image"),
                                     categories: [],
                                     tags: []))
    }
}
