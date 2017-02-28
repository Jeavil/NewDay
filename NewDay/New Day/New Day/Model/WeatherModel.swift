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
    let reporttime: String
    let lives: Array<Any>
    
    
    init(fromDictionary dictionary: [String: AnyObject]) {
        lives = dictionary["lives"] as? Array ?? []
        let weatherObj = lives.first as? [String:AnyObject] ?? [:]
        weather = weatherObj["weather"] as? String ?? ""
        city = weatherObj["city"] as? String ?? ""
        temperature = weatherObj["temperature"] as? String ?? ""
        humidity = weatherObj["humidity"] as? String ?? ""
        
        let date = weatherObj["reporttime"] as? String ?? ""
        let splitedArray = date.components(separatedBy: "-")
        let year = splitedArray[0] + "年"
        let month = splitedArray[1] + "月"
        var day = splitedArray[2]
        let index = day.index(year.startIndex, offsetBy: 2)
        day = day.substring(to: index)
        day = day + "日"
        var formatDate: String
        formatDate = year + month + day

        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "zh-Tw_POSIX")
        dateformatter.dateFormat = "YYYY年MM月dd日"
        let newDate = dateformatter.date(from: formatDate)
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.chinese)
        dateformatter.calendar = calendar as Calendar!
        var dateComponents = DateComponents()
        dateComponents = (calendar?.components([NSCalendar.Unit.day,NSCalendar.Unit.month,NSCalendar.Unit.year], from: newDate!))!
        let chineseMonth = String(dateComponents.month!) + "月"
        let chineseDay =  String(dateComponents.day!) + "日"
        let chineseDate = "农历" + year + chineseMonth + chineseDay
        reporttime = formatDate + "  " + chineseDate
        
    }
    
    func formatDate(_ reporttime: String) -> String {
        let splitedArray = reporttime.components(separatedBy: "-")
        let year = splitedArray[0] + "年"
        let month = splitedArray[1] + "月"
        var day = splitedArray[2]
        let index = day.index(year.startIndex, offsetBy: 2)
        day = day.substring(to: index)
        day = day + "日"
        return year + month + day

    }
}
