//
//  SettingsVC.swift
//  TabBar and App Settings
//
//  Created by Frankie Ariel on 10/12/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    
    let detailCellLabel = UILabel()
    let detailCellToggle = UISwitch()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .systemYellow
        setupView()
    }
    
    func setupView() {
        setupDetailCellLabel()
        setupDetailCellToggle()
    }
    
    func setupDetailCellLabel() {
        view.addSubview(detailCellLabel)
        
        detailCellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailCellLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        detailCellLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        detailCellLabel.text = "Detail Cell"
    }
    
    func setupDetailCellToggle() {
        view.addSubview(detailCellToggle)
        
        detailCellToggle.translatesAutoresizingMaskIntoConstraints = false
        
        detailCellToggle.topAnchor.constraint(equalTo: detailCellLabel.bottomAnchor, constant: 10).isActive = true
        detailCellToggle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        detailCellToggle.addTarget(self, action: #selector(detailCellToggleAction), for: .touchUpInside)
        
        let isDetailCellToggleOn = UserDefaults.standard.bool(forKey: "detailcell")
        detailCellToggle.setOn(isDetailCellToggleOn, animated: false)
    }
    
    @objc func detailCellToggleAction(_ sender: UISwitch) {
        
        UserDefaults.standard.set(sender.isOn, forKey: "detailcell")
//        if sender.isOn {
//            view.backgroundColor = .systemPink
//        } else {
//            view.backgroundColor = .systemYellow
//        }
    }
}
