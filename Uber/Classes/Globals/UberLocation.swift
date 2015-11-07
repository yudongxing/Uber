//
//  UberLocation.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit
import CoreLocation

class UberLocation: NSObject,CLLocationManagerDelegate {

    private var manager : CLLocationManager?
    
    func getLocation(){
        
        if CLLocationManager.locationServicesEnabled(){
            manager = CLLocationManager()
            
            manager?.delegate = self
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            manager?.distanceFilter = 100
            
            manager?.startUpdatingLocation()
            manager?.requestAlwaysAuthorization()
        }
    }
    
    //MARK:delegate
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        searchAddress(locations[0])
        
        //stop updateing location
        self.manager?.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        self.searchAddress(newLocation)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("status\(status)")
    }
    
    //MARK:private methods 
    func searchAddress(location:CLLocation){
        let coder = CLGeocoder()
        coder.reverseGeocodeLocation(location) { (places, error) -> Void in
            if places != nil {
                for place in places! {
                    place.name
                }
            }
        }
    }

    
}
