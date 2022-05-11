//
//  SearchListVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/11/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchListVC: MainTheme {
    
    var whatUsearch = "Search: "
    let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        button.tintColor = UIColor.white.withAlphaComponent(0.9)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: config), for: .normal)
        // lessthan.square.fill
        return button
    }()
    
    let searchForLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23)
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let serchListTable = UITableView()
    
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopSearchBar()
        setupSearchListTable()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    func setupSearchListTable() {
        view.addSubview(serchListTable)
        serchListTable.delegate = self
        
        serchListTable.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
    }
    
    
    func setupTopSearchBar() {
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
       backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(searchForLabel)
        searchForLabel.text = whatUsearch

        searchForLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        searchForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    
    
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class AlertController: UIAlertController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
    }

}
