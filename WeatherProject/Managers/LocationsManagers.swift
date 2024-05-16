//
//  LocationsManagers.swift
//  WeatherProject
//
//  Created by Gülsüm Demirbaş on 15.05.2024.
//

import Foundation
import CoreLocation

class LocationsManagers : NSObject , ObservableObject , CLLocationManagerDelegate{
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
    }
     
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Hata Lokasyon Alınamadı :  " , error)
        isLoading = false
    }
    
    
}
