//
//  ContentView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var vendorsViewModel = VendorsViewModel()
    
    var body: some View {
        VStack {
            SearchBar(searchText: $vendorsViewModel.searchText)
                .padding(.horizontal, 16)
            
            List(vendorsViewModel.vendors) { vendor in
                
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
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
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
