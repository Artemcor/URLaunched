//
//  SearchBarView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 26.04.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    @State private var isEditing = false
    
    var body: some View {
        TextField("Search...", text: $searchText)
            .padding(7)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
            .background(.white)
            .cornerRadius(16)
            .shadow(color: Color("gray_searchBarShadow"),  radius: 14, x: 0, y: 6)
            .onSubmit {
                if searchText.isEmpty {
                    withAnimation {
                        isEditing = false
                    }
                }
            }
            .overlay(
                HStack {
                    Image("icon_search")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 8)
                    
                    if isEditing {
                        Button(action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            
                            searchText = ""
                            withAnimation {
                                isEditing = false
                            }
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .onTapGesture {
                withAnimation {
                    isEditing = true
                }
            }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
