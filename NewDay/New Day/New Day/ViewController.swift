//
//  ViewController.swift
//  New Day
//
//  Created by Jeavil_Tang on 2017/2/14.
//  Copyright © 2017年 Jeavil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playerView:UIView!
    var weatherView:UIView!
    
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var topContainerHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weatherView = Bundle.main.loadNibNamed("WeatherDetailView", owner: self, options: nil)?[0] as! WeatherDetailView
        self.topContainerHeightContraint.constant = self.view.frame.width * 0.5866
        self.topContainer.addSubview(self.weatherView)
        
        self.playerView = Bundle.main.loadNibNamed("MusicPlayerView", owner:self,options:nil)?[0] as! MusicPlayerView
        self.bottomView.addSubview(self.playerView)
        
       
    }

    override func viewDidLayoutSubviews() {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

}

