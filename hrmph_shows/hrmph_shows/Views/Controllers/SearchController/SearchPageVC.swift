//
//  SearchPageVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchPageVC: MainTheme {

    let searchView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        let button = UIButton()
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration: config), for: .normal)
        
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.15)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        return view
    }()
    
    
    let searchField: UITextField = {
       let search = UITextField()
        search.backgroundColor = .clear
        search.layer.cornerRadius = 25
        search.textColor = UIColor.white.withAlphaComponent(0.7)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        search.attributedPlaceholder = NSAttributedString(
            string: "Search the show...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(0.8), .paragraphStyle: centeredParagraphStyle]
        )
        search.font = .systemFont(ofSize: 23)
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchView()
        self.navigationController?.isNavigationBarHidden = true
        
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
