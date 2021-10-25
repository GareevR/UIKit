//
//  AmiiboCell.swift
//  TableView
//
//  Created by Frankie Ariel on 10/6/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class AmiiboCell: UITableViewCell {
    
    
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let gameSeriesLabel = UILabel()
    let owningCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupView() {
        
        safeArea = layoutMarginsGuide
        
        setupOwningCountLabel()
        setupImageView()
        setupNameLabel()
        setupGameSeries()
    }
    
    func setupOwningCountLabel() {
        addSubview(owningCountLabel)
        
        owningCountLabel.translatesAutoresizingMaskIntoConstraints = false
        owningCountLabel.leadingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        owningCountLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }
    
    func setupImageView() {
        
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        imageIV.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        imageIV.layer.borderWidth = 0.75
        imageIV.layer.borderColor = UIColor.black.cgColor
        imageIV.layer.cornerRadius = 7
        imageIV.contentMode = UIView.ContentMode.scaleAspectFit
        imageIV.clipsToBounds = true
    }
    
    func setupNameLabel() {
        
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -7).isActive = true
        
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
    }
    
    func setupGameSeries() {
        
        addSubview(gameSeriesLabel)
        
        gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false
        gameSeriesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        gameSeriesLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 10).isActive = true
        
        gameSeriesLabel.font = UIFont(name: "Helvetica", size: 14)
    }
}
