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
    
    var city: String? {
        didSet {
            self.cityLabel.text = city
        }
    }
    
    var temperature: String? {
        didSet {
            self.temperatureLabel.text = temperature
        }
    }
    
    var date: String? {
        didSet {
            self.dateLabel.text = date
        }
    }
    
    var weather: String? {
        didSet {
            self.weatherLabel.text = weather
        }
    }
    
    var airQuality: String? {
        didSet {
            self.airQualityLabel.text = airQuality
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
