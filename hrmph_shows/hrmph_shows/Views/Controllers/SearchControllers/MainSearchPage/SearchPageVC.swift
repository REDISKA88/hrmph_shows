//
//  SearchPageVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchPageVC: MainTheme {

    @objc func searchShowButton() {
        let vc = SearchListVC()
        guard let searching = searchField.text, searching.count > 0 else {return}
        vc.whatUsearch = searching
        let trimmed = searching.filter {!$0.isWhitespace}
        vc.seachTheShow(byQuery: trimmed)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    var modernVM = ModernViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMainShows()
        setupSearchView()
        setupCollectionView()
        self.hideKeyboardWhenTappedAround()
        //search
       // self.view.layoutIfNeeded()
        
    }
    
    func loadMainShows() {
        modernVM.fetchPopularShows { [weak self] in
            self?.showCollectionView.reloadData()
        }
        
    }
    
    var sortState = "Most Popular"
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

    let showCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.layer.cornerRadius = 20
        cv.register(ShowsCell.self, forCellWithReuseIdentifier: "ShowsCell")
        cv.register(HeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        let button = UIButton()
        button.addTarget(self, action: #selector(searchShowButton), for: .touchUpInside)
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration: config), for: .normal)
        
       // view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.15)
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        return view
    }()
}
