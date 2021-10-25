//
//  ViewController.swift
//  TableView
//
//  Created by Frankie Ariel on 10/6/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class AmiiboListVC: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var amiiboList = [AmiiboForView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        
        tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cellid")
        tableView.dataSource = self
        tableView.delegate = self
        
        setupView()
        
        let anonymousFunction = {
            (fetchedAmiiboList : [Amiibo]) in
            DispatchQueue.main.async {
                let amiiboForViewList = fetchedAmiiboList.map{
                    amiibo in
                    return AmiiboForView(
                        name: amiibo.name,
                        gameSeries: amiibo.gameSeries,
                        imageUrl: amiibo.image,
                        count: 0)
                }
                self.amiiboList = amiiboForViewList
                self.tableView.reloadData()
            }
        }
        
        AmiiboAPI.shared.fetchAmiiboList(onCompletion: anonymousFunction)
    }

    // MARK: - Setup View
    
    private func setupView() {
        
        // Subview needs to be added before setting the constraints |ALWAYS|
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource

extension AmiiboListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amiiboList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let amiibo = amiiboList[indexPath.row]
        
        guard let amiiboCell = cell as? AmiiboCell else {
            return cell
        }
        
        amiiboCell.nameLabel.text = amiibo.name
        amiiboCell.gameSeriesLabel.text = amiibo.gameSeries
        amiiboCell.owningCountLabel.text = String(amiibo.count)
        if let url = URL(string: amiibo.imageUrl) {
            amiiboCell.imageIV.loadImage(from: url)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate


extension AmiiboListVC: UITableViewDelegate {
    
    // Trailing swipe
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in
             
            if self.amiiboList[indexPath.row].name == "Luigi" {
                completionHandler(false)
            } else {
                self.amiiboList.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                completionHandler(true)
            }
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    // Leading swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let countUpAction = UIContextualAction(style: .normal, title: "Up") {
            (action, view, completionHandler) in
             
            let currentCount = self.amiiboList[indexPath.row].count
            self.amiiboList[indexPath.row].count = currentCount + 1
            
            if let cell = self.tableView.cellForRow(at: indexPath) as? AmiiboCell {
                cell.owningCountLabel.text = String(self.amiiboList[indexPath.row].count)
            }
            completionHandler(true)
        }
        
        let countDownAction = UIContextualAction(style: .normal, title: "Down") {
            (action, view, completionHandler) in
             
            let currentCount = self.amiiboList[indexPath.row].count
            if currentCount < 1 {
                completionHandler(false)
            } else {
                self.amiiboList[indexPath.row].count = currentCount - 1
                
                if let cell = self.tableView.cellForRow(at: indexPath) as? AmiiboCell {
                    cell.owningCountLabel.text = String(self.amiiboList[indexPath.row].count)
                }
                completionHandler(true)
            }
        }
        countUpAction.backgroundColor = .systemGreen
        countDownAction.backgroundColor = .systemRed
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [countUpAction, countDownAction])
        return swipeActionConfig
    }
    
    // Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // Cell tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let amiibo = self.amiiboList[indexPath.row]
        let amiiboDetailVC = AmiiboDetailVC()
        
        amiiboDetailVC.amiibo = amiibo
//        amiiboDetailVC.modalPresentationStyle = .fullScreen
        self.present(amiiboDetailVC, animated: true)
    }
}
