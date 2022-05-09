//
//  SearchBarVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchBarVC: MainTheme {
    
    let tableView = UITableView()
    let searchShow: UIView = {
        let show = UIView()
        // show.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        show.layer.cornerRadius = 30
        show.translatesAutoresizingMaskIntoConstraints = false
        show.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
    
        let label = UILabel()
        label.numberOfLines = 0
        // label.minimumScaleFactor = 0.5
        label.text = "Search show by title"
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        show.addSubview(label)
        label.topAnchor.constraint(equalTo: show.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: show.leadingAnchor, constant: 60).isActive = true
        label.trailingAnchor.constraint(equalTo: show.trailingAnchor, constant: 5).isActive = true
        label.bottomAnchor.constraint(equalTo: show.bottomAnchor, constant: -20).isActive = true
        
        let searchImage = UIImageView()
        let tvImage = UIImageView()
        tvImage.image = UIImage(systemName: "tv")
        searchImage.image = UIImage(systemName: "magnifyingglass")
        tvImage.translatesAutoresizingMaskIntoConstraints = false
        tvImage.tintColor = UIColor.white.withAlphaComponent(0.9)
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.tintColor = UIColor.white.withAlphaComponent(0.9)
        show.addSubview(tvImage)
        show.addSubview(searchImage)

        searchImage.topAnchor.constraint(equalTo: show.topAnchor, constant: 45).isActive = true
        searchImage.leadingAnchor.constraint(equalTo: show.leadingAnchor, constant: 10).isActive = true
        searchImage.trailingAnchor.constraint(equalTo: label.centerXAnchor, constant: -55).isActive = true
        searchImage.bottomAnchor.constraint(equalTo: show.bottomAnchor, constant: -65).isActive = true
        
        tvImage.topAnchor.constraint(equalTo: show.centerYAnchor, constant: 10).isActive = true
        tvImage.leadingAnchor.constraint(equalTo: show.leadingAnchor, constant: 15).isActive = true
        tvImage.trailingAnchor.constraint(equalTo: label.centerXAnchor, constant: -65).isActive = true
        tvImage.bottomAnchor.constraint(equalTo: show.bottomAnchor, constant: -40).isActive = true
        
        return show
    }()
    
    
    let searchActor: UIView = {
        let show = UIView()
        // show.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        show.layer.cornerRadius = 30
        show.translatesAutoresizingMaskIntoConstraints = false
        show.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        
        let label = UILabel()
        label.numberOfLines = 0
        // label.minimumScaleFactor = 0.5
        label.text = "Search actors by name"
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        show.addSubview(label)
        label.topAnchor.constraint(equalTo: show.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: show.leadingAnchor, constant: 60).isActive = true
        label.trailingAnchor.constraint(equalTo: show.trailingAnchor, constant: 5).isActive = true
        label.bottomAnchor.constraint(equalTo: show.bottomAnchor, constant: -20).isActive = true
        
        let searchImage = UIImageView()
        let personImage = UIImageView()
        searchImage.image = UIImage(systemName: "magnifyingglass")
        personImage.image = UIImage(systemName: "person.2")
        personImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.tintColor = UIColor.white.withAlphaComponent(0.9)
        searchImage.tintColor = UIColor.white.withAlphaComponent(0.9)
        show.addSubview(searchImage)
        show.addSubview(personImage)
        searchImage.topAnchor.constraint(equalTo: show.topAnchor, constant: 45).isActive = true
        searchImage.leadingAnchor.constraint(equalTo: show.leadingAnchor, constant: 10).isActive = true
        searchImage.trailingAnchor.constraint(equalTo: label.centerXAnchor, constant: -55).isActive = true
        searchImage.bottomAnchor.constraint(equalTo: show.bottomAnchor, constant: -65).isActive = true
        
        personImage.topAnchor.constraint(equalTo: show.centerYAnchor, constant: 10).isActive = true
        personImage.leadingAnchor.constraint(equalTo: show.leadingAnchor, constant: 10).isActive = true
        personImage.trailingAnchor.constraint(equalTo: label.centerXAnchor, constant: -65).isActive = true
        personImage.bottomAnchor.constraint(equalTo: show.bottomAnchor, constant: -40).isActive = true
        
        return show
    }()
    
    let searchShowButton: UIButton = {
       let showButton = UIButton()
        showButton.layer.masksToBounds = true
        showButton.layer.cornerRadius = 30
        showButton.backgroundColor = .clear
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
    let searchActorButton: UIButton = {
       let showButton = UIButton()
        showButton.layer.masksToBounds = true
        showButton.layer.cornerRadius = 30
        showButton.backgroundColor = .clear
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupSearchViews()
        setupSearchButtons()
        
    }
    
    func setupSearchButtons() {
        searchShow.addSubview(searchShowButton)
        searchActor.addSubview(searchActorButton)

        searchShowButton.topAnchor.constraint(equalTo: searchShow.topAnchor).isActive = true
        searchShowButton.leadingAnchor.constraint(equalTo: searchShow.leadingAnchor).isActive = true
        searchShowButton.trailingAnchor.constraint(equalTo: searchShow.trailingAnchor).isActive = true
        searchShowButton.bottomAnchor.constraint(equalTo: searchShow.bottomAnchor).isActive = true
        
        searchActorButton.topAnchor.constraint(equalTo: searchActor.topAnchor).isActive = true
        searchActorButton.leadingAnchor.constraint(equalTo: searchActor.leadingAnchor).isActive = true
        searchActorButton.trailingAnchor.constraint(equalTo: searchActor.trailingAnchor).isActive = true
        searchActorButton.bottomAnchor.constraint(equalTo: searchActor.bottomAnchor).isActive = true
        
    }
    
    func setupSearchViews() {
        view.addSubview(searchShow)
        view.addSubview(searchActor)
        searchShow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        searchShow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        searchShow.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        searchShow.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        searchActor.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        searchActor.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        searchActor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        searchActor.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
    }
}
