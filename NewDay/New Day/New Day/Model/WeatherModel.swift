//
//  WeatherModel.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/16.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import UIKit

struct WeatherModel {

    let city: String
    let weather: String
    let temperature: String
    let humidity: String
    let lives: Array<Any>
    
    init(fromDictionary dictionary: [String: AnyObject]) {
        lives = dictionary["lives"] as? Array ?? []
        let weatherObj = lives.first as! NSDictionary
        weather = weatherObj["weather"] as? String ?? ""
        city = weatherObj["city"] as? String ?? ""
        temperature = weatherObj["temperature"] as? String ?? ""
        humidity = weatherObj["humidity"] as? String ?? ""
    }
}
