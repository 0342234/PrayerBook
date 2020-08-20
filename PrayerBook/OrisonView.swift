//
//  OrisonView.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 12.08.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import UIKit

class OrisonView: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var orisonLabel: UILabel!
    
    var orison: Orison = Orison(id: UUID.init(),
                                text: "",
                                title: "",
                                shortText: "")
    
    var orisonPresenter = OrisonPresenter(orisonsService: OrisonsService())
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInstall(orison)
        orisonPresenter.attachView(self)
        
    }
    
    func dataInstall(_ orison:Orison)  {
        self.textView.text = orison.text
        self.orisonLabel.text = orison.title
    }
}


extension OrisonView: OrisonViewProtocol {
    func setOrison(_ orison: Orison) {
        self.orison = orison
    }
}
