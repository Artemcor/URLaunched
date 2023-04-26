//
//  ContentView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var vendorsModel: [Vendor] = []
    
    var body: some View {
        List(vendorsModel) { vendor in
            VStack(alignment: .leading) {
                MainCellImage(vendor: vendor)
                
                Text(vendor.companyName)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                CategoriesView(vendor: vendor)
                
                Text(tagsString(vendor.tags))
            }
            .padding()
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear(perform: loadVendors)
    }
    
    private func loadVendors() {
        let dataMock = DataMock.validUserListData
        
        let networkSession = NetworkSessionMock()
        networkSession.data = dataMock
        networkSession.error = nil
        
        let networkManager = NetworkManager(session: networkSession)
        
        VendorsLoader.fetchUsers(
            manager: networkManager,
            completion: { response in
                switch response {
                case let .success(result):
                    vendorsModel = result
                case let .failure(error):
#warning("add handler")
                }
            }
        )
    }
    
    private func tagsString(_ tags: [Tag]) -> String {
        var tagsString = ""
        for tag in tags {
            if !tagsString.isEmpty {
                tagsString += " "
            }
            tagsString += "• "
            tagsString += tag.name
        }
        return tagsString
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
