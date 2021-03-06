//
//  SearchPageVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

protocol ModalDelegate {
    func changeValue(value: FilteredShow)
}

class SearchPageVC: MainTheme, ModalDelegate {

    func changeValue(value: FilteredShow) {
        filterState = value
        modernVM.applyFiltered(with: value)
        showCollectionView.reloadData()
        guard filtersWasEnable(filter: filterState) else {return }
        //modernVM.shiftNotFilteredShows()
        modernVM.applyFiltered(with: filterState)
      }
    
    var filterState = FilteredShow()
    var sortingState = SortingShow()
    var modernVM = ModernViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMainShows()
        setupSearchView()
        setupCollectionView()
        self.hideKeyboardWhenTappedAround()
        if filtersWasEnable(filter: self.filterState) {
            print("filter is enable")
        } else {
            print("filter disable")
        }
        //search
       // self.view.layoutIfNeeded()
    }

    
    func loadMainShows() {
        modernVM.fetchPopularShows { [weak self] in
            self?.showCollectionView.reloadData()
        }
    }
    @objc func searchShowButton() {
        let vc = SearchListVC()
        guard let searching = searchField.text, searching.count > 0 else {return}
        vc.whatUsearch = searching
        let trimmed = searching.filter {!$0.isWhitespace}
        vc.seachTheShow(byQuery: trimmed)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func filtersWasEnable(filter: FilteredShow) -> Bool {
        guard filter.genres.isEmpty,
            filter.runtime.isEmpty,
            filter.status.isEmpty,
            filter.type.isEmpty else { return true }
        return false
    }
    
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
