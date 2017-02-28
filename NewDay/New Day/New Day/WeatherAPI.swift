//
//  WeatherAPI.swift
//  New Day
//
//  Created by ray on 28/02/2017.
//  Copyright © 2017 Jeavil. All rights reserved.
//

import Foundation

enum WeatherAPI: RawRepresentable {
    case city(longtitude: String, latitude: String)
    case weatherInfo(city: String)
    
    
    typealias RawValue = String
    init?(rawValue: RawValue) { return nil }
    
    var rawValue: String {
        switch self {
        case .city(let longtitude, let latitude):
            return "https://restapi.amap.com/v3/geocode/regeo?key=8c29c5ca7eea8480e49a571ea73aea6d&location=\(longtitude),\(latitude)"
        case .weatherInfo(let city):
            return "https://restapi.amap.com/v3/weather/weatherInfo?key=8c29c5ca7eea8480e49a571ea73aea6d&city=\(city)"
        }
    }
}

extension WeatherAPI: APIRequestable {
    enum Result: RequestResult {
        case success(json: Any)
        case failure(Swift.Error)
        
        init(data: Data?, response: URLResponse?, error: Swift.Error?) {
            guard error == nil else {
                self = .failure(error!)
                return
            }
            
            do {
                let jsonObj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [String:AnyObject]
                self = .success(json: jsonObj)
            } catch let error {
                self = .failure(error)
            }
        }
        
        var success: Bool {
            switch self {
            case .success(_):
                return true
            default:
                return false
            }
        }
        
        var value: Any? {
            switch self {
            case .success(let json):
                return json
            default:
                return nil
            }
        }
        
        var error: Error? {
            switch self {
            case .failure(let error):
                return error
            default:
                return nil
            }
        }
    }
    
    func makeRequest(with parameter: [String : Any]?) -> URLRequest {
        return rawValue.URLValue!.request
    }
}
