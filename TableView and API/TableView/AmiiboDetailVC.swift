//
//  AmiiboDetailVC.swift
//  TableView
//
//  Created by Frankie Ariel on 10/8/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class AmiiboDetailVC: UIViewController {
    
    var amiibo: AmiiboForView?
    
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = .black
//        setUpDismissButton()
        setupImage()
        setupNameLabel()
        setupData()
        setupDismissButton()
    }
    
    func setupImage() {
        view.addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        
        imageIV.contentMode = .scaleAspectFit
        
        imageIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        imageIV.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        
        imageIV.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        imageIV.heightAnchor.constraint(equalTo: imageIV.widthAnchor).isActive = true
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: imageIV.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: imageIV.centerXAnchor).isActive = true
        
        nameLabel.textColor = .white
    }
    
    func setupDismissButton() {
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        
        dismissButton.bounds = CGRect(x: 0, y: 0, width: 200, height: 50)
//        dismissButton.backgroundColor = .clear
        
        
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        
//        dismissButton.layer.borderWidth = 0.75
//        dismissButton.layer.borderColor = UIColor.white.cgColor
//        dismissButton.layer.cornerRadius = 5
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    func setupData() {
        if let amiibo = amiibo, let url = URL(string: amiibo.imageUrl) {
            imageIV.loadImage(from: url)
            nameLabel.text = amiibo.name
        }
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
}
