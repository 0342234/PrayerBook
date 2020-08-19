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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = orison.text
        orisonLabel.text = orison.title
    }
    

    func setOrison(_ orison: Orison) {
        self.orison = orison
    }
}
