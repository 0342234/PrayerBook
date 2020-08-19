//
//  OrisonsSectionHeader.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 29.07.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import UIKit

protocol OrisonsSectionHeaderProtocol: class {
    func didTapped(_ view: OrisonsSectionHeader)
}

class OrisonsSectionHeader: UIView {
    weak var delegate: OrisonsSectionHeaderProtocol?
    
    init(title: String,
         width: CGFloat,
         delegate: OrisonsSectionHeaderProtocol) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: 100))
        
        self.delegate = delegate
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: width, height: 100))
        
        label.text = title
        label.textColor = UIColor.blue
        label.backgroundColor = UIColor.green
        
        self.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapped))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func didTapped() {
        delegate?.didTapped(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
