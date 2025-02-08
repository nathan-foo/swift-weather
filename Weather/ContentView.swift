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
            // Custom light blue color from Assets
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
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
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 83)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temperature: 62)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.rain.fill",
                                   temperature: 48)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 30)
                }
                
                // Adds a bunch of space, use to organize UI
                Spacer()
                
                Button {
                    print("Button clicked")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

// Right click on former VStack and click "extract subview" to make this struct
struct WeatherDayView: View {
    
    // Set variables to be passed in
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
