//
//  ContentView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var vendorsModel: [Vendor] = []
    
        func loadVendors() {
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
    
    var body: some View {
        List {
            ForEach(vendorsModel, id: \.self) { index in
                VStack(alignment: .leading) {
                    ZStack {
                        Image("template")
                            .resizable()
                            .frame(width: .infinity, height: 170)
                            .cornerRadius(10)
                    }
                    Text("North St. Butchery")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
            }
        }
        .listStyle(.plain)
        .onAppear(perform: loadVendors)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(vendorsModel: [Vendor]())
    }
}
