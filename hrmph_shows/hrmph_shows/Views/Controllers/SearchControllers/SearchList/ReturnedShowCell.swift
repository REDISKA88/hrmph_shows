//
//  SearchCells.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ReturnedShowCell: UITableViewCell {
    
    let imageShow: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleShow: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 21)
        label.text = "Title for the show"
        return label
    }()
    
    let genresShow: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.minimumScaleFactor = 0.5
        text.textAlignment = .left
        text.textColor = UIColor.white.withAlphaComponent(0.6)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 19)
        text.text = "Adventure, Strory"
        return text
    }()
    
    let yearShow: UILabel = {
        let date = UILabel()
        date.textAlignment = .center
       // date.textColor = UIColor.systemRed.withAlphaComponent(0.9)
        date.textColor = UIColor.white.withAlphaComponent(0.9)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .boldSystemFont(ofSize: 21)
        date.clipsToBounds = true
        date.text = "2022"
        return date
    }()
    
    let countryShow: UILabel = {
        let country = UILabel()
        country.textAlignment = .left
        country.textColor = UIColor.systemRed.withAlphaComponent(0.9)
        country.translatesAutoresizingMaskIntoConstraints = false
        country.font = .systemFont(ofSize: 21)
        country.clipsToBounds = true
        return country
    }()
    
    let ratingShow: UILabel = {
        let rate = UILabel()
        rate.textAlignment = .center
        rate.textColor = UIColor.green.withAlphaComponent(0.7)
        rate.font = .systemFont(ofSize: 20)
        rate.clipsToBounds = true
        rate.text = "8.5"
        return rate
    }()
    
    let ratingStarShow :UIImageView = {
        let star = UIImageView()
        star.image = UIImage(systemName: "star.circle.fill")
        star.tintColor = UIColor.green.withAlphaComponent(0.7)
        //star.translatesAutoresizingMaskIntoConstraints = false
        star.contentMode = .scaleAspectFit
        return star
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
        backgroundColor = .clear
        setupImage()
        setupTitle()
        setupYear()
        setupGenres()
        setupRating()
        
    }
    
    func setupRating() {
        addSubview(ratingShow)
        addSubview(ratingStarShow)
        ratingShow.translatesAutoresizingMaskIntoConstraints = false
        ratingShow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        ratingShow.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        ratingShow.topAnchor.constraint(equalTo: yearShow.topAnchor, constant: 0).isActive = true
        ratingShow.bottomAnchor.constraint(equalTo: yearShow.bottomAnchor, constant: 0).isActive = true
        
        ratingStarShow.translatesAutoresizingMaskIntoConstraints = false
        ratingStarShow.topAnchor.constraint(equalTo: ratingShow.topAnchor, constant: -10).isActive = true
        ratingStarShow.bottomAnchor.constraint(equalTo: ratingShow.bottomAnchor, constant: 10).isActive = true
        ratingStarShow.trailingAnchor.constraint(equalTo: ratingShow.leadingAnchor, constant: 0).isActive = true
        ratingStarShow.leadingAnchor.constraint(equalTo: ratingShow.leadingAnchor, constant: -30).isActive = true
//        ratingStarShow.frame = CGRect(x: 280, y: 55, width: 30, height: 30)
//        ratingShow.frame = CGRect(x: 315, y: 55, width: 50, height: 30)
    }
    
    func setupGenres() {
        addSubview(genresShow)
        genresShow.leadingAnchor.constraint(equalTo: yearShow.leadingAnchor, constant: 0).isActive = true
        genresShow.topAnchor.constraint(equalTo: yearShow.bottomAnchor, constant: 10).isActive = true
        genresShow.bottomAnchor.constraint(equalTo: imageShow.bottomAnchor, constant: -15).isActive = true
        genresShow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func setupYear() {
        addSubview(yearShow)
        yearShow.text = "2010"
        yearShow.topAnchor.constraint(equalTo: titleShow.bottomAnchor, constant: 10).isActive = true
        yearShow.leadingAnchor.constraint(equalTo: titleShow.leadingAnchor, constant: 5).isActive = true
        yearShow.heightAnchor.constraint(equalToConstant: 25).isActive = true

      }
    
    func setupTitle() {
        addSubview(titleShow)
       titleShow.text = "Game of Thrones"
        titleShow.topAnchor.constraint(equalTo: imageShow.topAnchor, constant: 10).isActive = true
        titleShow.leadingAnchor.constraint(equalTo: imageShow.trailingAnchor, constant: 20).isActive = true
        titleShow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupImage() {
        addSubview(imageShow)
          imageShow.backgroundColor = .clear
          imageShow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
          imageShow.heightAnchor.constraint(equalToConstant: 130).isActive = true
          imageShow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
          imageShow.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90).isActive = true
    }
    
}
