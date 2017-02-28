//
//  ViewController.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/14.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,LocationManagerDelegate {

    var playerView:MusicPlayerView!
    var weatherView:WeatherDetailView!
    var locationManager: LocationManager?
    var networkService: NetworkService?
    
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var topContainerHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weatherView = Bundle.main.loadNibNamed("WeatherDetailView", owner: self, options: nil)?.first as! WeatherDetailView
        self.topContainerHeightContraint.constant = self.view.frame.width * 0.5866
        self.topContainer.addSubview(self.weatherView)
        
        self.playerView = Bundle.main.loadNibNamed("MusicPlayerView", owner:self,options:nil)?.first as! MusicPlayerView
        self.bottomView.addSubview(self.playerView)
        
        locationManager = LocationManager()
        locationManager?.delegate = self
        locationManager?.requestLocation()
        
        networkService = NetworkService()
    }
    
    // LocationManagerDelegate
    func locationDidUpdate(location: CLLocation) {
        if(location.coordinate.latitude != 0  && location.coordinate.longitude != 0 ){
            networkService?.requestSpecificCity(location) { cityModel in
                self.networkService?.requestWeatherInfo(cityModel.city) { weatherModel in
                    DispatchQueue.main.async {
                        self.updateWeatherView(weatherModel)
                    }
                }
            }
        }
    }
    
    func updateWeatherView(_ weatherInfo: WeatherModel) {
        self.weatherView.weatherStackView.isHidden = false
        self.weatherView.weatherLabel.text = weatherInfo.weather
        self.weatherView.cityLabel.text = weatherInfo.city
        self.weatherView.temperature = weatherInfo.temperature + " " + "℃"
        self.weatherView.humidityLabel.text = "湿度" + "  " + weatherInfo.humidity
        var weatherIconName: String = ""
        weatherIconName = self.getWeatherIcon(weatherInfo.weather)
        self.weatherView.weatherIcon.image = UIImage.init(named: weatherIconName)
        self.weatherView.dateLabel.text = weatherInfo.reporttime
    }
    
    
    func updateMusicView(_ musicInfo: MusicModel) {
        
    }
    
    
    func getWeatherIcon(_ weatherDec:String) -> String {
        var icon:String = " "
        switch weatherDec {
        case "晴":
            icon = "icon_sunshine"
            break
        case "阴":
            icon = "icon_yin"
            break
        case "多云":
            icon = "icon_duoyun"
            break
        case "阵雨":
            icon = "icon_zhenyu"
            break
        case "小雨":
            icon = "icon_xiaoyu"
            break
        case "中雨":
            icon = "icon_zhongyu"
            break
        case "大雨":
            icon = "icon_dayu"
            break
        case "暴雨":
            icon = "icon_baoyu"
            break
        default:
            break
        }
        return icon
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

