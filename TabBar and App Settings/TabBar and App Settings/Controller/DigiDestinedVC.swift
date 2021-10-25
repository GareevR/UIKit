//
//  ViewController.swift
//  TabBar and App Settings
//
//  Created by Frankie Ariel on 10/12/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class DigiDestinedVC: UIViewController {

    let tableView = UITableView()
    let digiDestinedList = [
        DigiDestined(name: "Sai", digimon: "Agumon"),
        DigiDestined(name: "Matt", digimon: "Gabumon"),
        DigiDestined(name: "Keks", digimon: "Patapon"),
        DigiDestined(name: "John", digimon: "Lalaon"),
        DigiDestined(name: "Pete", digimon: "Billion"),
        DigiDestined(name: "Mini", digimon: "Salmon"),
        DigiDestined(name: "Loul", digimon: "Polsimon")
    ]
    var safeArea: UILayoutGuide!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        safeArea = view.safeAreaLayoutGuide
        setupView()
    }
    
    func setupView() {
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cellid")
        tableView.dataSource = self
        tableView.backgroundColor = .white

    }
    
}

extension DigiDestinedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return digiDestinedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let digiDestined = digiDestinedList[indexPath.row]
        
        cell.textLabel?.text = digiDestined.name
        cell.detailTextLabel?.text = digiDestined.digimon
        
        let isDetailTextVisible = UserDefaults.standard.bool(forKey: "detailcell")
        cell.detailTextLabel?.isHidden = !isDetailTextVisible
        
        return cell
    }
}
