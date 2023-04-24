//
//  DataMock.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import Foundation

class DataMock {
    static var validUserListData: Data { return jsonData("VendorsMockableData") }
    
    private static func jsonData(_ filename: String) -> Data {
        let path = Bundle(for: self).path(forResource: filename, ofType: "json")!
        let jsonString = try! String(contentsOfFile: path, encoding: .utf8)
        return jsonString.data(using: .utf8)!
    }
}
