//
//  VendorsViewModel.swift
//  URLaunched
//
//  Created by Artem Stozhok on 27.04.2023.
//

import Foundation
import Combine

class VendorsViewModel: ObservableObject {
    
    private var initialVendors: [Vendor] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var vendors: [Vendor] = []
    @Published var searchText = ""
    
    init() {
        loadVendors()
        
        $searchText
            .receive(on: RunLoop.main)
            .map { text in
                if text.count >= 3 {
                    return self.initialVendors.filter { vendor in
                        vendor.companyName.contains(text)
                    }
                } else {
                    return self.initialVendors
                }
            }
            .assign(to: \.vendors, on: self)
            .store(in: &cancellableSet)
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
                    self.initialVendors = result
                case let .failure(error):
                    print("Error - data is not loaded: \(error.localizedDescription)")
                }
            }
        )
    }
}


