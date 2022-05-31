//
//  SearchPageVCDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension SearchPageVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modernVM.numberOfShows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowsCell", for: indexPath) as! ShowsCell
        cell.backgroundColor = .clear
        let thisShow = modernVM.showForIndex(index: indexPath.row)
        
        cell.titleLabel.text = thisShow.name
        guard let image = URL(string:(thisShow.image?.original)!) else { return cell }
        getImageFrom(url: image, for: cell.showImageView)
             return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let thisShow = modernVM.showForIndex(index: indexPath.row)
        let vc = ModernShowInfoVC()
        vc.updateUserInterface(with: thisShow)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3.6, height: 200)
    }
    
    //MARK: - HEADER FOR COLLECTION VIEW
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.identifier, for: indexPath) as! HeaderCollectionView
        let state = sortingState.generateResult()
        header.setupSort(by: state)
        header.sortButton.addTarget(self, action: #selector(showSortAlert), for: .touchUpInside)
        header.filterButton.addTarget(self, action: #selector(pressFilterButton), for: .touchUpInside)
        
        
        return header
    }
    
    
    //MARK: - FILTER BUTITON
    @objc func pressFilterButton() {
        let vc = FilterShowsVC()
        vc.delegate = self
        vc.filter = filterState
        self.present(vc, animated: true)
    }

    @objc func showSortAlert() {
        print("FILTER")
        
        print("...................................")
          print(filterState.genres)
          print(filterState.status)
          print(filterState.type)
          print(filterState.runtime)
          print("...................................")
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet, blurStyle: .dark)
        
        let popularAction = UIAlertAction(title: "Most popular", style: .default, handler: selectMostPopularSort)
        let followedAction = UIAlertAction(title: "Most followed", style: .default, handler: selectMostFollowedSort)
        let ratingAction = UIAlertAction(title: "Highest rating", style: .default, handler: selectHighestRatingSort)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        popularAction.setValue(UIColor.white, forKey: "titleTextColor")
        followedAction.setValue(UIColor.white, forKey: "titleTextColor")
        ratingAction.setValue(UIColor.white, forKey: "titleTextColor")
        cancelAction.setValue(UIColor.white, forKey: "titleTextColor")
        controller.addAction(popularAction)
        controller.addAction(followedAction)
        controller.addAction(ratingAction)
        controller.addAction(cancelAction)
        controller.pruneNegativeWidthConstraints()
        present(controller, animated: true, completion: nil)
    }
    
    func selectMostPopularSort(alert: UIAlertAction!) {
        sortingState.setupState(by: .MostPopular)
        self.showCollectionView.reloadData()
    }
    
    func selectMostFollowedSort(alert: UIAlertAction!) {
        sortingState.setupState(by: .MostFollowed)
        self.showCollectionView.reloadData()
       }
    
    func selectHighestRatingSort(alert: UIAlertAction!) {
        sortingState.setupState(by: .HighestRating)
        self.showCollectionView.reloadData()
    }
    
}

extension UIAlertController {

}
extension UIView {

    var recursiveSubviews: [UIView] {
        var subviews = self.subviews.compactMap({$0})
        subviews.forEach { subviews.append(contentsOf: $0.recursiveSubviews) }
        return subviews
    }
}
extension UIAlertController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        pruneNegativeWidthConstraints()
    }

    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
    private struct AssociatedKeys {
        static var blurStyleKey = "UIAlertController.blurStyleKey"
    }

    public var blurStyle: UIBlurEffect.Style {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.blurStyleKey) as? UIBlurEffect.Style ?? .extraLight
        } set (style) {
            objc_setAssociatedObject(self, &AssociatedKeys.blurStyleKey, style, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            view.setNeedsLayout()
            view.layoutIfNeeded()
        }
    }

    public var cancelButtonColor: UIColor? {
        return blurStyle == .dark ? UIColor(red: 28.0/255.0, green: 28.0/255.0, blue: 28.0/255.0, alpha: 1.0) : nil
    }

    private var visualEffectView: UIVisualEffectView? {
        if let presentationController = presentationController, presentationController.responds(to: Selector(("popoverView"))), let view = presentationController.value(forKey: "popoverView") as? UIView
        {
            return view.recursiveSubviews.compactMap({$0 as? UIVisualEffectView}).first
        }

        return view.recursiveSubviews.compactMap({$0 as? UIVisualEffectView}).first
    }

    private var cancelActionView: UIView? {
        return view.recursiveSubviews.compactMap({
            $0 as? UILabel}
        ).first(where: {
            $0.text == actions.first(where: { $0.style == .cancel })?.title
        })?.superview?.superview
    }

    public convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, blurStyle: UIBlurEffect.Style) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        self.blurStyle = blurStyle
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        visualEffectView?.effect = UIBlurEffect(style: blurStyle)
        cancelActionView?.backgroundColor = cancelButtonColor
    }
}

