//
//  ReviewShowVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 6/5/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit


class ReviewShowVC: UIViewController {
    
    var id: Int!
    var review: String!
    var delegate: ReviewDelegate?
    
    let applyReviewButton = UIButton()
    var myReviewlabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My review"
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    let reviewTextView: UITextView = {
        let review = UITextView()
        review.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
        review.layer.cornerRadius = 15
        review.font = UIFont.systemFont(ofSize: 20)
        review.textColor = UIColor.white.withAlphaComponent(0.9)
        review.textAlignment = .left
        review.translatesAutoresizingMaskIntoConstraints = false
        return review
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1489986777, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        self.hideKeyboardWhenTappedAround()
        reviewTextView.becomeFirstResponder()
        setupReviewShowViews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/5.45, width: self.view.bounds.width, height: UIScreen.main.bounds.height)
        self.view.layer.cornerRadius = 45
        self.view.layer.masksToBounds = true
        
    }
    
    @objc func applyReviewButtonPressed() {
        if reviewTextView.text.count == 0 { review = nil } else {
            review = reviewTextView.text
        }
        delegate?.updateReview(id: id, review: review)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupReviewShowViews() {
        view.addSubview(reviewTextView)
        view.addSubview(myReviewlabel)
        view.addSubview(applyReviewButton)
        
        
        myReviewlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        myReviewlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        applyReviewButton.setupApplyButton()
        applyReviewButton.centerYAnchor.constraint(equalTo: myReviewlabel.centerYAnchor).isActive = true
        applyReviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        applyReviewButton.addTarget(self, action: #selector(applyReviewButtonPressed), for: .touchUpInside)
        
        reviewTextView.topAnchor.constraint(equalTo: applyReviewButton.bottomAnchor, constant: 20).isActive = true
        reviewTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        reviewTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        reviewTextView.bottomAnchor.constraint(equalTo: reviewTextView.topAnchor, constant: 150).isActive = true
        
        if review != nil {
            reviewTextView.text = review
        }
    }
    
}
