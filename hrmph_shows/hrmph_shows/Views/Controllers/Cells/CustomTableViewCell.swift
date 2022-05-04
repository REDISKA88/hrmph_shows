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
        text.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.3)

        text.font = .systemFont(ofSize: 22)
        text.text = "description of the this show must be here, coming soon"
          return text
      }()
    
    let year: UILabel = {
        let date = UILabel()
        date.textAlignment = .center
        date.textColor = UIColor.red.withAlphaComponent(0.5)
        date.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
        date.font = .boldSystemFont(ofSize: 20)
        date.text = "2022"
        return date
    }()
    let botView: UIView = {
       let bot = UIView()
        bot.backgroundColor = UIColor.red.withAlphaComponent(0.4)
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
        botView.frame = CGRect(x: 160, y: 150, width: 120, height: 40)
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

/*
class CustomTableViewCell: UITableViewCell {

    lazy var backView: UIView = {
         let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
         view.backgroundColor = UIColor.white
         return view
    }()
         
    lazy var userImage: UIImageView = {
         let userImage = UIImageView(frame: CGRect(x: 4, y: 4, width: 104, height: 104))
         userImage.contentMode = .scaleAspectFill
         return userImage
    }()
         
    lazy var namelbl: UILabel = {
         let lbl = UILabel(frame: CGRect(x: 116, y: 8, width: backView.frame.width - 116, height: 30))
         lbl.textAlignment = .left
         lbl.font = UIFont.boldSystemFont(ofSize: 18)
         return lbl
    }()
         
    lazy var agelbl: UILabel = {
         let lbl = UILabel(frame: CGRect(x: 116, y: 42, width: backView.frame.width - 116, height: 30))
         lbl.textAlignment = .left
         return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: a)
          addSubview(backView)
          backView.addSubview(userImage)
          backView.addSubview(namelbl)
          backView.addSubview(agelbl)
    }
    
    override func layoutSubviews() {
          contentView.backgroundColor = UIColor.clear
          backgroundColor = UIColor.clear
          backView.layer.cornerRadius = 5
          backView.clipsToBounds = true
          userImage.layer.cornerRadius = 52
          userImage.clipsToBounds = true
    }

}

*/
