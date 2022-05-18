//
//  FilterShowsVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/18/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class FilterShowsVC: MainTheme {
    var filter = FilteredShow()
     var delegate: ModalDelegate?
    var cellIsSelected = false
    var topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.contentMode = .center
        label.text = "Filter Shows"
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let applyButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.white.withAlphaComponent(0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "arrow.uturn.right.circle.fill", withConfiguration: config), for: .normal)
        return button
    }()
    
    var filterTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterTopView()
        setupFilterTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        applySelectedFilters()
        
    }
    
    
    func applySelectedFilters() {
        let path = IndexPath(row: 1, section: 0)
        let path2 = IndexPath(row: 2, section: 0)
        let path3 = IndexPath(row: 3, section: 0)
        let path4 = IndexPath(row: 4, section: 0)
        let path5 = IndexPath(row: 0, section: 0)
        filterTableView.selectRow(at: path, animated: false, scrollPosition: .none)
        filterTableView.selectRow(at: path3, animated: false, scrollPosition: .none)
        filterTableView.selectRow(at: path2, animated: false, scrollPosition: .none)
        filterTableView.selectRow(at: path4, animated: false, scrollPosition: .none)
        filterTableView.selectRow(at: path5, animated: false, scrollPosition: .none)
    }
    
    func setupFilterTableView() {
        view.addSubview(filterTableView)
        filterTableView.delegate = self
        filterTableView.dataSource = self
        filterTableView.layer.cornerRadius = 30
        filterTableView.allowsMultipleSelection = true
        filterTableView.showsVerticalScrollIndicator = false
        filterTableView.translatesAutoresizingMaskIntoConstraints = false
       // filterTableView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        filterTableView.backgroundColor = .clear
        filterTableView.register(FilterCell.self, forCellReuseIdentifier: FilterCell.identifier)

        filterTableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        filterTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        filterTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        filterTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupFilterTopView() {
        self.view.layer.cornerRadius = 40
        self.view.layer.masksToBounds = true
        view.addSubview(topLabel)
        view.addSubview(applyButton)
        applyButton.addTarget(self, action: #selector(filterBack), for: .touchUpInside)
        
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        applyButton.centerYAnchor.constraint(equalTo: topLabel.centerYAnchor, constant: 0).isActive = true
        applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    @objc func filterBack() {
        if let delegate = self.delegate {
            delegate.changeValue(value: filter)
        }
        self.dismiss(animated: true) { [weak self] in
            self?.applyFilterSettings()
            
        }
        
    }
    
    
    func applyFilterSettings() {
        print("apply filter settings")
    }
}
