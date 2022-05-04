//
//  CustomTableViewCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/3/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let back: UIView = {
        let bg = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 200))
      //  bg.backgroundColor = .green
        return bg
    }()
    
    let show: UIImageView = {
      //let im = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.clipsToBounds = true
        im.layer.cornerRadius = 15
        im.backgroundColor = .red
        return im
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemTeal
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Title for the show"
        return label
    }()
    
    let about: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.minimumScaleFactor = 0.5
        text.textAlignment = .left
        text.textColor = .white
       // text.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.3)

        text.font = .systemFont(ofSize: 22)
        text.text = "description of the this show must be here, coming soon"
          return text
      }()
    
    let year: UILabel = {
        let date = UILabel()
        date.textAlignment = .center
        date.textColor = UIColor.systemTeal.withAlphaComponent(0.7)
     //  date.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
        date.font = .boldSystemFont(ofSize: 21)
        date.clipsToBounds = true
        date.text = "2022"
        return date
    }()
    
    let rate: UILabel = {
        let rate = UILabel()
        rate.textAlignment = .center
        rate.textColor = UIColor.white
       // rate.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        rate.font = .boldSystemFont(ofSize: 20)
        rate.clipsToBounds = true
        rate.text = "8.3"
        return rate
    }()
    
    let rateStar :UIImageView = {
        let star = UIImageView()
        star.image = UIImage(systemName: "star.fill")
        star.tintColor = UIColor.systemTeal.withAlphaComponent(0.7)
        star.contentMode = .scaleAspectFit
        return star
    }()
    
    let botView: UIView = {
       let bot = UIView()
        bot.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.1)
        bot.layer.cornerRadius = 10
        return bot
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(back)
        backgroundColor = .clear
        back.addSubview(show)
        back.addSubview(title)
        back.addSubview(about)
        back.addSubview(botView)
        
        botView.frame = CGRect(x: 160, y: 150, width: 165, height: 40)
        botView.addSubview(year)
        botView.addSubview(rate)
        botView.addSubview(rateStar)
        year.frame = CGRect(x: 5, y: 0, width: 60, height: 40)
        rateStar.frame = CGRect(x: 85, y: -1, width: 30, height: 40)
        rate.frame = CGRect(x: 120, y: -2, width: 40, height: 45)
        //back.addSubview(year)
       // year.frame = CGRect(x: 160, y: 140, width: 60, height: 30)
        about.frame = CGRect(x: 160, y: 40, width: 180, height: 100)
        about.layer.cornerRadius = 50
        title.frame = CGRect(x: 150, y: 20, width: 300, height: 30)
        show.frame = CGRect(x: 10, y: 10, width: 120, height: 180)
    }
    
    func setupCell() {
        
        
    }
}

