//
//  CustomCell.swift
//  TabBar and App Settings
//
//  Created by Frankie Ariel on 10/12/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
