//
//  ContentView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var vendors: [Vendor] = []
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
                .padding(.horizontal, 16)

            List {
                ForEach(vendors.filter({ searchText.count < 3 ? true : $0.companyName.contains(searchText) })) { vendor in
                    
                    VStack(alignment: .leading) {
                        MainCellImageView(vendor: vendor)
                        
                        Text(vendor.companyName)
                            .font(.custom("OpenSans-Bold", size: 16, relativeTo: .headline))
                            .foregroundColor(Color("gray_primary"))
                        
                        CategoriesView(vendor: vendor)
                        
                        Text(tagsString(vendor.tags))
                            .font(.custom("OpenSans-Regular", size: 14, relativeTo: .body))
                            .foregroundColor(Color("gray_secondary"))
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
        .onAppear {
            UITableView.appearance().backgroundColor = .clear

            if vendors.isEmpty {
                loadVendors()
            }
        }
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
                    vendors = result
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
