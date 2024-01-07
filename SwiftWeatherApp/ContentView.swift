//
//  ContentView.swift
//  SwiftWeatherApp
//
//  Created by Azizbek  Rasulov on 07/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundView(topColor: Color.blue, bottomColor: Color("LightBlue"))
            
            VStack{
                CityNameView(cityName:"Tashkent, UZ")
                
                CurrentWeatherView(imageName: "cloud.rain.fill", temperature: 11)
                
                WeekWeatherView()
                
                Spacer()
                
                Button{
                    print("Tapped")
                }label: {
                    WeatherButtonLabelView(title: "Change Day Time", backgroundColor: Color.white, textColor: Color.blue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String = "MON"
    var imageName: String = "cloud.fill"
    var temperature: Int = 0
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.blue)
            
            VStack(spacing:8){
                Image(systemName: imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,height: 40)
                   
                
                Text("\(temperature)°")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(.thinMaterial.opacity(0.5))
        .cornerRadius(15)
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: String = "cloud.fill"
    var temperature: Int = 0
    
    var body: some View{
        VStack(spacing:8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150,height: 150)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .padding()
        .background(.thinMaterial.opacity(0.5))
        .cornerRadius(20)
    }
}

struct WeekWeatherView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:10){
                WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.rain.fill", temperature: 4)
                WeatherDayView(dayOfWeek: "WED", imageName: "cloud.fog.fill", temperature: 7)
                WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sleet.fill", temperature: 2)
                WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 12)
                WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.snow.fill", temperature: 0)
                WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.snow.fill", temperature: 1)
            }
            .padding()
        }
    }
}


