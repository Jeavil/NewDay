//
//  LocaionManager.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/16.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate {
    func locationDidUpdate(location:CLLocation)
}

class LocationManager: NSObject,CLLocationManagerDelegate {
    
    var delegate: LocationManagerDelegate?
    
    private let locationManger = CLLocationManager()
    
    override init() {
        super.init()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        let status = CLLocationManager.authorizationStatus();
        if status == CLAuthorizationStatus.notDetermined {
            locationManger.requestAlwaysAuthorization()
            locationManger.requestWhenInUseAuthorization()
        }
    }
    
    
    func requestLocation() {
        locationManger.requestLocation()
    }
    
    
    // CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
        print("location = \(location)")
            delegate?.locationDidUpdate(location: location)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error--->\(error)")
    }
}
