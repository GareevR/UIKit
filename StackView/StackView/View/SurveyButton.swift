//
//  SurveyButton.swift
//  StackView
//
//  Created by Frankie Ariel on 10/14/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class SurveyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemPink
        titleLabel?.font = UIFont(name: "Helvetica", size: 28)
        layer.cornerRadius = 10
    }
}
