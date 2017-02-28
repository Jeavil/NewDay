//
//  WeatherDetailView.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/16.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import UIKit

class WeatherDetailView: UIView {
    
    @IBOutlet weak var weatherStackView: UIStackView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      
    }
    
    func addAttributeToTemperatureLabel(_ temperature: String) -> NSMutableAttributedString{
        let attriStr = NSMutableAttributedString(string:temperature)
        attriStr.addAttribute(NSFontAttributeName, value: UIFont.init(name: "Avenir", size: 20) ?? "", range: NSMakeRange(3,temperature.characters.count))
        return attriStr
    }
    
    var city: String? {
        didSet {
            self.cityLabel.text = city
        }
    }
    
    var temperature: String? {
        didSet {
            self.temperatureLabel.text = temperature
            self.temperatureLabel.attributedText = self.addAttributeToTemperatureLabel(temperature!)
        }
    }
    
    var weather: String? {
        didSet {
            self.weatherLabel.text = weather
        }
    }
    
    var humidity: String? {
        didSet {
            self.humidityLabel.text = humidity
        }
    }

    
}
