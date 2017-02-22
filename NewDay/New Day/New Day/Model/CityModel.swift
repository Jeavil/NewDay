//
//  CityModel.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/21.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import Foundation

struct CityModel {
    let city : String
    let country: String
    let district: String
    let township : String
    let regeocode: NSDictionary
    
    init(fromDictionary dictionary: [String: AnyObject]) {
        regeocode = dictionary["regeocode"] as! NSDictionary
        let addressComponent = regeocode["addressComponent"] as! NSDictionary
        city = addressComponent["city"] as? String ?? ""
        country = addressComponent["country"] as? String ?? ""
        district = addressComponent["district"] as? String ?? ""
        township = addressComponent["township"] as? String ?? ""
    }
}
