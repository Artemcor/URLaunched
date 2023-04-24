//
//  ContentView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var vendorsModel: [Vendor] = []
    
        func fdfd() {
            let fixtureData = DataMock.validUserListData
    
            let networkSession = NetworkSessionMock()
            networkSession.data = fixtureData
            networkSession.error = nil
    
            let networkManager = NetworkManager(session: networkSession)
    
            var expectedResults: [Vendor]?
            var expectedError: Error?
    
            VendorsLoader.fetchUsers(
                manager: networkManager,
                completion: { response in
                    switch response {
                    case let .success(result):
                        expectedResults = result
                        vendorsModel = result
                    case let .failure(error):
                        expectedError = error
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
        .onAppear(perform: fdfd)
    }
}

struct ContentView_Previews: PreviewProvider {
    
//    func fdfd() -> Vendors? {
//        let fixtureData = DataFixtures.validUserListData
//
//        let networkSession = NetworkSessionMock()
//        networkSession.data = fixtureData
//        networkSession.error = nil
//
//        let networkManager = NetworkManager(session: networkSession)
//
//        var expectedResults: Vendors?
//        var expectedError: Error?
//
//        UserListLoader.fetchUsers(
//            manager: networkManager,
//            completion: { response in
//                switch response {
//                case let .success(result):
//                    expectedResults = result
//                case let .failure(error):
//                    expectedError = error
//                }
//            }
//        )
//        return expectedResults
//    }
    
    static var previews: some View {
        ContentView(vendorsModel: [Vendor]())
    }
}
