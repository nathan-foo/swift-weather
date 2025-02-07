//
//  ContentView.swift
//  Weather
//
//  Created by Nathan Foo on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            // Set background color and ignore safe areas
            // Color(.blue)
                // .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
