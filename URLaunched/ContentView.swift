//
//  ContentView.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(1...4, id: \.self) { index in
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
