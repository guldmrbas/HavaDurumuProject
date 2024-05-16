//
//  ContentView.swift
//  WeatherProject
//
//  Created by Gülsüm Demirbaş on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManagers = LocationsManagers()
    var weatherManager = WeatherManager()
    @State var weaather: ResponseBody?
    
    
    
    var body: some View {
        VStack {
            
            if let location = locationManagers.location{
                if let weather = weaather{
                   WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                               weaather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Weather is wrong : \(error)")
                            }
                        }
                }
                Text("Your Coordinations : \(location.longitude) , \(location.latitude)")
            }else{
                if locationManagers.isLoading{
                   LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManagers)
                
                }
            }
                
            
            
        
        }.background(Color(red: 0.012, green: 0.168, blue: 0.641))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    ContentView()
}
