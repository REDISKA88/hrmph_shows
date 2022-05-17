//
//  SetupSListViews.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/17/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension SearchListVC {
    func setupSearchListTable() {
        view.addSubview(listTable)
        listTable.delegate = self
        listTable.dataSource = self
        listTable.layer.masksToBounds = true
        listTable.layer.cornerRadius = 30
        listTable.showsVerticalScrollIndicator = false
        listTable.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        listTable.register(ReturnedShowCell.self, forCellReuseIdentifier: "ReturnedShowCell")
        listTable.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        listTable.topAnchor.constraint(equalTo: searchForLabel.bottomAnchor, constant: 20).isActive = true
        listTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        listTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        listTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    
    func setupTopSearchBar() {
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
       backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(searchForLabel)
        searchForLabel.text = "Search: " + whatUsearch

        searchForLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        searchForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
}
