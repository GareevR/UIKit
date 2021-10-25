//
//  ViewController.swift
//  SearchBar
//
//  Created by Frankie Ariel on 10/18/21.
//  Copyright © 2021 Frankie Ariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filteredCountries = [Country]()
    
    let countries = Country.GetAllCountries()
    
    let searchBar = UISearchBar()
    
    let tableView = UITableView()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries..."
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .prominent
        
        searchController.searchBar.scopeButtonTitles = ["All", "Europe", "Asia", "Africa"]
        
        searchController.searchBar.delegate = self
        
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        setupView()
        setupTableView()
    }
    
    // MARK: - TableView
    
    func setupTableView() {
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        tableView.register(CountryCell.self, forCellReuseIdentifier: "customcell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredCountries = countries.filter({
            (country: Country) -> Bool in
            let doesCategoryMatch = (scope == "All") || (country.continent == scope)
            
            if isSearchBarEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && country.title.lowercased().contains(searchText.lowercased())
            }
        })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func setupView() {
        
        view.backgroundColor = .white
        title = "Search Bar"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeIsFiltering)
    }
}
// MARK: - SearchBar

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        print("\(searchController.searchBar.selectedScopeButtonIndex)")
        
        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
    }
}

// MARK: - TableView

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCountries.count
        }
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let countryCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as? CountryCell else { return UITableViewCell() }
        
        let currentCountry: Country
        
        if isFiltering() {
            currentCountry = filteredCountries[indexPath.row]
        } else {
            currentCountry = countries[indexPath.row]
        }
        
        countryCell.titleLabel.text = currentCountry.title
        countryCell.categoryLabel.text = currentCountry.continent
        
        return countryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
