//
//  ViewController.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 08.07.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import UIKit

class OrisonsView: UIViewController {
    
    @IBOutlet private weak var orisonList: UITableView!
    @IBOutlet weak var search: UITextField!
    
    var searchString = ""
    
    var searchOrisons = [OrisonSectionViewData]()
    
    let orisosnsPresenter = OrisonsPresenter(orisonsService: OrisonsService())
    
    var presentedOrisons = [OrisonSectionViewData]()
    
    var orisons = [OrisonSectionViewData]()
    
    var selectedOrison: Orison!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orisosnsPresenter.attachView(self)
        
        orisonList.register(OrisonTableViewCell.self,
                            forCellReuseIdentifier: OrisonTableViewCell.self.description())
        
        orisosnsPresenter.getOrisons()
        
        orisosnsPresenter.setupView()
    }
}

extension OrisonsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = OrisonsSectionHeader(title: presentedOrisons[section].groupTitle,
                                          width: orisonList.frame.width,
                                          delegate: self)
        header.tag = section
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = presentedOrisons[section]
        return section.isOpened ? section.orisons.count : 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presentedOrisons.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let orisonCell =  orisonList.dequeueReusableCell(withIdentifier: OrisonTableViewCell.self.description(),
                                                               for: indexPath) as? OrisonTableViewCell else {
                                                                return UITableViewCell()
        }
        orisonCell.textLabel?.text = presentedOrisons[indexPath.section].orisons[indexPath.row].name
        return orisonCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OrisonView") as? OrisonView
        
        guard let orisonView = vc else { return }
        
    
        
        let orisonDMX = orisosnsPresenter.getOrison(with: indexPath)
        
        selectedOrison = orisonDMX
        
        prepare(for: UIStoryboardSegue(identifier: "listToOrison", source: self, destination: orisonView), sender: nil)
        performSegue(withIdentifier: "listToOrison", sender: nil)
       
    }
}

extension OrisonsView: OrisonsViewProtocol {
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func setOrisons(_ orisons: [OrisonSectionViewData]) {
        self.orisons = orisons
        self.presentedOrisons = orisons
        orisonList.reloadData()
    }
    
    func setEmptyOrisons() {
        
    }

}

extension OrisonsView: OrisonsSectionHeaderProtocol {
    func didTapped(_ view: OrisonsSectionHeader) {
        let tag = view.tag
        
        presentedOrisons[tag].isOpened = !presentedOrisons[tag].isOpened
        
        orisonList.reloadSections(IndexSet(arrayLiteral: tag), with: .automatic)
    }
}

extension OrisonsView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let searchText  = textField.text! + string
        
        if searchText.count >= 0 {
            orisonList.isHidden = false
            
            presentedOrisons = orisons.filter({ (section) -> Bool in
                
                
                let filteredSection = section.orisons.filter { (orison) -> Bool in
                    return orison.name.lowercased().contains(searchText.lowercased())
                }
                
                return !filteredSection.isEmpty
            })
            
            orisonList.reloadData()
        } else {
            presentedOrisons = []
        }
        return true
    }
}

//MARK: - Navigation

extension OrisonsView {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToOrison" {
            if let destinationVC = segue.destination as? OrisonView {
                destinationVC.setOrison(selectedOrison)
            }
        }
    }
}

