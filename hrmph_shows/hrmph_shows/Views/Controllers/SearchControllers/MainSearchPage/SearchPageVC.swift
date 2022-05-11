//
//  SearchPageVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchPageVC: MainTheme {
    
    var thisShowsImages = ["0", "1", "2","3","4","5","6","7","8", "9", "10","11","12","13","14","15", "16", "17","18","19","20","21","22","23","24","25","26","27","28"]
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
    
    
    @objc func searchShowButton() {
        let vc = SearchListVC()
      //  guard let searching = searchField.text, searching.count > 0 else {return}
       // vc.whatUsearch += searching
        self.navigationController?.pushViewController(vc, animated: true)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        thisShowsImages.shuffle()
        setupSearchView()
        setupCollectionView()
        self.navigationController?.isNavigationBarHidden = true
        self.hideKeyboardWhenTappedAround()
        
        //search
       // self.view.layoutIfNeeded()
        
    }
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


//MARK: - With scrollView
/*

 class SearchPageVC: MainTheme {
     
     var thisShowsImages = ["0", "1", "2","3","4","5","6","7","8", "9", "10","11","12","13","14","15", "16", "17","18","19","20","21","22","23","24","25","26","27","28"]
     
     let mostPopularText = "Sort by: Most popular"
     let mostFollowedText = "Sort by: Most Followed"
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
     
     let sortButton: UIButton = {
         let sort = UIButton()
         sort.tintColor = UIColor.white.withAlphaComponent(0.8)
         sort.translatesAutoresizingMaskIntoConstraints = false
         let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .large)
         sort.setImage(UIImage(systemName: "arrow.up.arrow.down.square.fill", withConfiguration: config), for: .normal)
         
         return sort
     }()
     
     let sortLabel: UILabel = {
         let label = UILabel()
         label.textAlignment = .center
         label.text = "Sort by:   Most popular"
         label.textColor = UIColor.white.withAlphaComponent(0.7)
         label.font = .systemFont(ofSize: 20)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     let filterButton: UIButton = {
         let filter = UIButton()
         filter.tintColor = UIColor.white.withAlphaComponent(0.8)
         filter.translatesAutoresizingMaskIntoConstraints = false
         let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .large)
         filter.setImage(UIImage(systemName: "equal.square.fill", withConfiguration: config), for: .normal)
         
         return filter
     }()
     
     let showCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 20
         layout.minimumInteritemSpacing = 5
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.showsHorizontalScrollIndicator = false
         cv.register(ShowsCell.self, forCellWithReuseIdentifier: "ShowsCell")
         cv.backgroundColor = .darkGray
         return cv
     }()
     override func viewDidLoad() {
         super.viewDidLoad()
         
         
         thisShowsImages.shuffle()
         
         
         view.addSubview(scrollView)
         scrollView.addSubview(scrollViewContainer)
         scrollViewContainer.addArrangedSubview(mainVeiw)
         setupSearchView()
         setupScrollView()
         setupScrollViewContainer()
         setupTopView()
         setupSort()
         self.navigationController?.isNavigationBarHidden = true
         
     }
     
     func setupScrollView() {
         scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         scrollView.topAnchor.constraint(lessThanOrEqualTo: searchView.bottomAnchor, constant: 10).isActive = true
         scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }
     
     func setupScrollViewContainer() {
         scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
         scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
         scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
         scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
         
         scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
     }
     
     func setupTopView() {
         setupSearchView()
         setupSort()
         setupCollectionView()
     }
     
     let scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         scrollView.showsVerticalScrollIndicator = false
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         return scrollView
     }()

     let scrollViewContainer: UIStackView = {
         let view = UIStackView()

         view.axis = .vertical
         view.spacing = 0
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()

     let mainVeiw: UIView = {
         let view = UIView()
         let subview = UIView()
         subview.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(subview)
         subview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
         subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
         subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
         subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
         // MARK: -top corner backgroundView
         //subview.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
         subview.backgroundColor = UIColor.darkGray.withAlphaComponent(0.15)
         subview.layer.cornerRadius = 50
         view.heightAnchor.constraint(equalToConstant: 2000).isActive = true
         view.backgroundColor = .clear
         return view
     }()
     
     func setupCollectionView() {
         mainVeiw.addSubview(showCollectionView)
         showCollectionView.delegate = self
         showCollectionView.dataSource = self
         showCollectionView.topAnchor.constraint(equalTo: sortLabel.bottomAnchor, constant: 20).isActive = true
         showCollectionView.leadingAnchor.constraint(equalTo: mainVeiw.leadingAnchor, constant: 15).isActive = true
         showCollectionView.trailingAnchor.constraint(equalTo: mainVeiw.trailingAnchor, constant: -15).isActive = true
         showCollectionView.bottomAnchor.constraint(equalTo: mainVeiw.bottomAnchor, constant: 0).isActive = true
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
     
     func setupSort() {
         mainVeiw.addSubview(sortButton)
         sortButton.topAnchor.constraint(equalTo: mainVeiw.topAnchor, constant: 20).isActive = true
         sortButton.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 15).isActive = true
         
         mainVeiw.addSubview(filterButton)
         filterButton.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor).isActive = true
         filterButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -15).isActive = true
        
         mainVeiw.addSubview(sortLabel)
         sortLabel.text = mostFollowedText
         sortLabel.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor).isActive = true
         sortLabel.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
     }
 }

 
 
 
 
 
 */
