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
            //     .edgesIgnoringSafeArea(.all)
            VStack {
                // Order of modifiers (e.g. font, foregroundColor, etc.) matter
                // Basically wrapping in another view
                Text("Austin, TX")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                // Parameters to set different options for VStack and HStack
                VStack(spacing: 10) {
                    // renderingMode sets to original color instead of black
                    // resizable allows you to resize
                    // aspectRatio makes image fit in frame
                    // frame sets size parameters for image
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                // Adds a bunch of space, use to organize UI
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
