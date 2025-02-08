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
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            // Set background color and ignore safe areas
            // Color(.blue)
            //     .edgesIgnoringSafeArea(.all)
            
            VStack {
                CityTextView(cityName: "Austin, TX")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                
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
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        // Order of modifiers (e.g. font, foregroundColor, etc.) matter
        // Basically wrapping in another view
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            // renderingMode sets to original color instead of black
            // resizable allows you to resize
            // aspectRatio makes image fit in frame
            // frame sets size parameters for image
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

