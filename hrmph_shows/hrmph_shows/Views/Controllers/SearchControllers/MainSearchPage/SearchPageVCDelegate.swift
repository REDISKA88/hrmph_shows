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
        return viewModel.searchPageShows.returnedShowsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowsCell", for: indexPath) as! ShowsCell
        cell.backgroundColor = .clear
        let currentShow = viewModel.searchPageShows.returnedShowsArray[indexPath.row]
        cell.titleLabel.text = currentShow.name
             guard let url = URL(string: currentShow.image?.medium ?? "") else { return cell }
             do {
                 let data = try Data(contentsOf: url)
                 cell.showImageView.image = UIImage(data: data)
             } catch { print("error fail load image from url") }
             return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
        vc.show = viewModel.searchPageShows.returnedShowsArray[indexPath.row]
             self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3.6, height: 200)
    }
    
    //MARK: - HEADER FOR COLLECTION VIEW
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.identifier, for: indexPath) as! HeaderCollectionView
        header.sortButton.addTarget(self, action: #selector(showSortAlert), for: .touchUpInside)
        header.setupSort()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }

    @objc func showSortAlert() {
        
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet, blurStyle: .dark)
        
        let popularAction = UIAlertAction(title: "Most popular", style: .default, handler: nil)
        let followedAction = UIAlertAction(title: "Most followed", style: .default, handler: nil)
        let ratingAction = UIAlertAction(title: "Highest rating", style: .default, handler: nil)
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

