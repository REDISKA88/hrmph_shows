//
//  SearchListVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/11/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchListVC: MainTheme {

    var returnedList: [ShowQueryRequest]!
    var whatUsearch = ""
    let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        button.tintColor = UIColor.white.withAlphaComponent(0.9)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: config), for: .normal)
        
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
    
    let listTable = UITableView()
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    var searchlistVM = ModernViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopSearchBar()
        setupSearchListTable()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    func seachTheShow(byQuery: String) {
        searchlistVM.fetchShowQueryRequest(show: byQuery) {[weak self] in
            self?.listTable.reloadData()
        }
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
