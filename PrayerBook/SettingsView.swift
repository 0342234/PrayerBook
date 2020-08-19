//
//  SettingsView.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 17.08.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {

    @IBOutlet weak var fontSlider: UISlider!
    
    @IBOutlet weak var currentSlider: UILabel!
    
    @IBOutlet weak var fontSizeExampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSlider.minimumValue = 8
        fontSlider.maximumValue = 30
        
        fontSizeExampleLabel.text = "A"
    }
    
    @IBAction func fontSliderAction(_ sender: UISlider) {
        
        let currentSliderText = "Current value: \(sender.value.rounded())"
        
        currentSlider.text = currentSliderText
        
        Constants.font = CGFloat(sender.value)
        
       let lol =  fontSizeExampleLabel.font.withSize(Constants.font)
        fontSizeExampleLabel.font = lol
    }
}
