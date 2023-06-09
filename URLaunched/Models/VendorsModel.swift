//
//  VendorsModel.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import Foundation

// MARK: - Vendors
struct Vendors: Codable {
    let vendors: [Vendor]
}

// MARK: - Vendor
struct Vendor: Codable, Hashable, Identifiable {
    let id: Int
    let companyName, areaServed, shopType: String
    let favorited, follow: Bool
    let businessType: String
    let coverPhoto: CoverPhoto
    let categories: [Category]
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case companyName = "company_name"
        case areaServed = "area_served"
        case shopType = "shop_type"
        case favorited, follow
        case businessType = "business_type"
        case coverPhoto = "cover_photo"
        case categories, tags
    }
}

// MARK: - Category
struct Category: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let image: CoverPhoto
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable, Hashable {
    let id: Int
    let mediaURL: String
    let mediaType: String

    enum CodingKeys: String, CodingKey {
        case id
        case mediaURL = "media_url"
        case mediaType = "media_type"
    }
}

enum MediaType: String, Codable {
    case image = "image"
}

// MARK: - Tag
struct Tag: Codable, Hashable, Identifiable {
    let id: Int
    let name, purpose: String
}
