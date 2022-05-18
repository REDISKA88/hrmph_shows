//
//  SetupPageViews.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/18/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension SearchPageVC {
    func setupCollectionView() {
        view.addSubview(showCollectionView)
        showCollectionView.delegate = self
        showCollectionView.dataSource = self
        showCollectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 5).isActive = true
        showCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        showCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        showCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
    func setupSearchView() {
        view.addSubview(searchView)
        searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        searchView.addSubview(searchField)
        searchField.topAnchor.constraint(equalTo: searchView.topAnchor).isActive = true
        searchField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        searchField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10).isActive = true
        searchField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -50).isActive = true
    }
}
