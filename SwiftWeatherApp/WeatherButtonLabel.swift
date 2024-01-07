//
//  WeatherButtonLabel.swift
//  SwiftWeatherApp
//
//  Created by Azizbek  Rasulov on 07/01/24.
//

import SwiftUI

struct WeatherButtonLabelView: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,weight: .bold, design: .default ))
            .cornerRadius(10)
    }
}
