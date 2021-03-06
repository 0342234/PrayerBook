//
//  OrisonsPresenter.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 23.07.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import Foundation

struct OrisonSectionViewData {
    let groupTitle: String
    var isOpened: Bool
    let orisons: [OrisonViewData]
}

struct OrisonViewData {
    let name: String
    let text: String
}

protocol OrisonsView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setOrisons(_ users: [OrisonSectionViewData])
    func setEmptyOrisons()
}

class OrisonsPresenter {
    fileprivate let orisonsService: OrisonsService
    weak fileprivate var userView: OrisonsView?
    
    private var orisosns = [OrisonsSection]()
    
    init(orisonsService: OrisonsService){
        self.orisonsService = orisonsService
    }
    
    func attachView(_ view: OrisonsView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getOrison(with: IndexPath) -> Orison {
        return orisosns[with.section].orisosns[with.row]
    }
    
    func setupView() {
        let mappedOrisons = orisosns.map { section -> OrisonSectionViewData in
            
            let orisonsViewData = section.orisosns.map { orison -> OrisonViewData in
                return OrisonViewData(name: orison.title, text: orison.text)
            }
            
            return OrisonSectionViewData(groupTitle: section.title, isOpened: false, orisons: orisonsViewData)
        }
        
        self.userView?.setOrisons(mappedOrisons)
    }
    
    func getOrisons() {
        self.orisonsService.getOrisons { [weak self] (orisons) in
            
            self?.orisosns = orisons
            
        
        }
    }
}
