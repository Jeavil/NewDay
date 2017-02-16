//
//  WeatherDetailView.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/16.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import UIKit

class WeatherDetailView: UIView {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var airQualityLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var city: NSString? {
        get{
        return self.cityLabel.text as NSString?
        }
        set {
        self.cityLabel.text = newValue as String?;
        }
    }
    
    var temperature: NSString? {
        get {
            return self.temperatureLabel.text as NSString?
        }
        set {
            self.temperatureLabel.text = newValue as String?
        }
    }
    
    var date:NSString? {
        get {
            return self.dateLabel.text as NSString?
        }
        set{
            self.dateLabel.text = newValue as String?;
        }
    }
    
    var weather:NSString? {
        get {
            return self.weatherLabel.text as NSString?
        }
        set {
            self.weatherLabel.text = newValue as String?
        }
    }
    
    var airQuality:NSString? {
        get {
            return self.airQualityLabel.text as NSString?
        }
        set {
            self.airQualityLabel.text = newValue as String?
        }
    }

    
}
