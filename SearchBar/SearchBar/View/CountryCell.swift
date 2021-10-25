//
//  CustomCell.swift
//  SearchBar
//
//  Created by Frankie Ariel on 10/18/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let categoryLabel = UILabel()
    var safeArea: UILayoutGuide!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        safeArea = layoutMarginsGuide
        setupCategoryLabel()
        setupTitleLabel()
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: categoryLabel.trailingAnchor).isActive = true
//        titleLabel..constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    func setupCategoryLabel() {
        addSubview(categoryLabel)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        categoryLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
//        categoryLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        categoryLabel.textAlignment = .right
        categoryLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
