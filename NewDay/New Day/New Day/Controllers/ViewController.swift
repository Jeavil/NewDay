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

    var playerView:UIView!
    var weatherView:UIView!
    var locationManager: LocationManager!
    var networkService: NetworkService!
    
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
        locationManager.delegate = self;
        locationManager.requestLocation();
    }
    
    // LocationManagerDelegate
    func locationDidUpdate(location: CLLocation) {
        print("user location ---> \(location)");
        if (location.coordinate.latitude != 0 && location.coordinate.longitude != 0){
            networkService.requestSpecificCity(location)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

