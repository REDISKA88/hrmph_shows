//
//  RateShowVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 6/4/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class RateShowVC: UIViewController {
    var id: Int!
    var rating: Int!
    var delegate: RatingDelegate?
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.1489986777, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        setupUI(withRating: rating, forId: id)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/1.45, width: self.view.bounds.width, height: UIScreen.main.bounds.height)
        self.view.layer.cornerRadius = 45
        self.view.layer.masksToBounds = true

    }
    
    func setupUI(withRating: Int!, forId: Int) {
        setupRateLayouts()
        setupRateSlider()
        setupApplyRateButton()
        if withRating != nil {
            print(withRating ?? "kek")
            myRatingLeftLabel.text = "My rating"
            rateSlider.setValue(Float(withRating), animated: false)
            ratingResult.text = String(withRating)
        }
        
    }
    
    private func setupRateLayouts() {
        view.addSubview(applyRateButton)
        view.addSubview(myRatingLeftLabel)
        view.addSubview(ratingResult)
        view.addSubview(rateSlider)
        applyRateButton.setupApplyRateButton()
        
        myRatingLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        myRatingLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        applyRateButton.centerYAnchor.constraint(equalTo: myRatingLeftLabel.centerYAnchor).isActive = true
        applyRateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        
        ratingResult.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingResult.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
        ratingResult.heightAnchor.constraint(equalToConstant: 70).isActive = true
        ratingResult.widthAnchor.constraint(equalToConstant: 70).isActive = true
        rateSlider.topAnchor.constraint(equalTo: ratingResult.bottomAnchor, constant: 10).isActive = true
        rateSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        rateSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        rateSlider.bottomAnchor.constraint(equalTo: rateSlider.topAnchor, constant: 60).isActive = true
    }
    
    private func setupApplyRateButton() {
        applyRateButton.addTarget(self, action: #selector(applyRatePressed), for: .touchUpInside)
    }
    
    
    private func setupRateSlider() {
        rateSlider.addTarget(self, action: #selector(change(_:)), for: .valueChanged)
    
    }
    @objc func applyRatePressed(button: UIButton) {
        if let delegate = self.delegate {
            delegate.updateRating(id: id, rating: rating)
            print("change na this \(rating)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func change(_ slider:UISlider) {

        let rate = Int(round(slider.value))
        myRatingLeftLabel.text = "My rating"
        rating = rate
        ratingResult.setRating(with: rate)
    }
     
    @objc func sliderDragUp(sender: UISlider) {
        print("value:(sender.value)")
    }
    
    let applyRateButton = UIButton()
    let myRatingLeftLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not rated"
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    let ratingResult: UILabel = {
       let rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.text = ""
        rating.textAlignment = .center
        //rating.backgroundColor = UIColor.gray.withAlphaComponent(0.05)
        rating.clipsToBounds = true
       // rating.layer.cornerRadius = 33
        rating.textColor = UIColor.gray.withAlphaComponent(0.8)
        rating.font = UIFont.boldSystemFont(ofSize: 45)
        return rating
    }()
    
    let rateSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.setMinimumTrackImage(UIImage(systemName: "minus.circle"), for: .normal)
        slider.setMaximumTrackImage(UIImage(systemName: "plus.circle"), for: .normal)
        slider.minimumTrackTintColor = UIColor.systemGreen.withAlphaComponent(0.5)
        slider.maximumTrackTintColor = UIColor.systemRed.withAlphaComponent(0.5)
        slider.thumbTintColor = UIColor.lightGray.withAlphaComponent(1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.setValue(5, animated: true)
        return slider
    }()

}



extension UILabel {
    func setRating(with count: Int) {
        var rateColor: UIColor!
        switch count {
        case 1...2:
            rateColor = UIColor.red.withAlphaComponent(0.9)
        case 3...5:
            rateColor = UIColor.orange.withAlphaComponent(0.9)
        case 6...7:
            rateColor = UIColor.yellow.withAlphaComponent(0.9)
        case 8...9:
            rateColor = UIColor.green.withAlphaComponent(0.8)
        case 10:
            rateColor = UIColor.green.withAlphaComponent(1)
        default:
            break
        }
        self.textColor = rateColor
        self.text = String(count)
    }
}
extension UIButton {
     func setupApplyRateButton(){
        self.tintColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 27, weight: .light, scale: .large)
        self.setImage(UIImage(systemName: "checkmark.rectangle.fill", withConfiguration: config), for: .normal)
    }

}
