//
//  ContentView.swift
//  NetworkKitDemo
//
//  Created by Ofir Ron on 07/02/2025.
//

import SwiftUI
import NetworkKit

struct ContentView: View {
    @State private var textFromPackage = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Some action from package") {

                textFromPackage = SomeStupidNetworkKitClass().somethingStupid()
            }

            Text("A text from package")
            Text(textFromPackage)
                .lineLimit(2)
                .truncationMode(.tail)
                .padding()

            ScrollView {
                Text(textFromPackage)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
