//
//  OrisonPresenter.swift
//  PrayerBook
//
//  Created by Дмитрий Беседин on 20.08.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import Foundation
import UIKit

protocol OrisonViewDelegate: NSObjectProtocol {
    func setOrison(_ orison:Orison)
    
}


class OrisonPresenter {
    private let orisonsService:OrisonsService //
    weak private var delegate: OrisonViewDelegate?
    private var orison: Orison?
    
    init(orisonsService: OrisonsService) {
        self.orisonsService = orisonsService
    }
    func subscribeDelegate(_ orisonViewDelegate: OrisonViewDelegate)  {
        delegate = orisonViewDelegate
    }
    
}
