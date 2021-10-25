//
//  ViewController.swift
//  StackView
//
//  Created by Frankie Ariel on 10/14/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var safeArea: UILayoutGuide!
    var stackView = UIStackView()
//    var buttonArray: [UIButton] = []
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "UIStackView"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0
        
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        self.title = "UIStackView"
        setupTitleLabel()
        setupStackView()
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        // Constraints
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -30).isActive = true
        
        // Setup
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        addButtonsToStackView()
        
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 10
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle("\(i)", for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
}

