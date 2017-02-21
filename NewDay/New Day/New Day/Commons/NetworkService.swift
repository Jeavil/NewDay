//
//  NetworkService.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/21.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import Foundation
import CoreLocation

class NetworkService: NSObject {
    
    
    func requestSpecificCity(_ location:CLLocation, completionHanler: @escaping (CityModel) -> Void) {
        let latitude = location.coordinate.latitude
        let longtitude = location.coordinate.longitude
        
        let url = URL(string: "https://restapi.amap.com/v3/geocode/regeo?key=8c29c5ca7eea8480e49a571ea73aea6d&location=\(longtitude),\(latitude)")!
        let request = URLRequest(url: url as URL)
        let configuration = URLSessionConfiguration.default
        let session  = URLSession(configuration:configuration)
        let task = session.dataTask(with: request) { (_ data:Data?, _ response:URLResponse?, _ error:Error?) in
            if error == nil {
//                if (!JSONSerialization.isValidJSONObject(city)) {
//                    print("Isn't a vaild json object");
//                    return
//                }
                let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [String: AnyObject]
                print("Json Object ===>> \(jsonObj)")
                let cityModel = CityModel(fromDictionary: jsonObj ?? [:])
                completionHanler(cityModel)
            }
        }
        task.resume()
    }
    
    
//    func requestWeatherInfo(_ city:String) -> WeatherModel {
//        
//    }
}
