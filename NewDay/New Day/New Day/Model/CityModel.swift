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
    
    init(fromDictionary dictionary: [String: AnyObject]) {
        city = dictionary["city"] as? String ?? ""
        country = dictionary["country"] as? String ?? ""
        district = dictionary["district"] as? String ?? ""
        township = dictionary["township"] as? String ?? ""
    }
}
