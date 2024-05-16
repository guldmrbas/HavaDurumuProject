//
//  WelcomeView.swift
//  WeatherProject
//
//  Created by Gülsüm Demirbaş on 15.05.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManagers : LocationsManagers
    var body: some View {
        VStack {
            VStack(spacing : 20){
                Text("Welcome Weather App")
                    .bold().font(.title)
                Text("Please share location with us!")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManagers.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
