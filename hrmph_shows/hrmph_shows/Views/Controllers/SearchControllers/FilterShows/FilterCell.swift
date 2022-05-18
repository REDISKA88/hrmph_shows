//
//  FilterCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/18/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {
    static let identifier = "filterCell"
    var cellSelected = false
    var filter = FilteredShow()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkmark: UIImageView = {
       let check = UIImageView()
       // check.tintColor = UIColor.white.withAlphaComponent(0.99)
       // check.image = UIImage(systemName: "checkmark")
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    

    
    override func layoutSubviews() {
           super.layoutSubviews()
           reloadCell()
       }
    
    func reloadCell() {
         if isSelected {
            self.selectedBackgroundView!.isHidden = true
            contentLabel.textColor = .white
            checkmark.tintColor = .white
            contentView.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
         }
         else if isHighlighted{
            self.selectedBackgroundView!.isHidden = true
            contentLabel.textColor = .white
            checkmark.tintColor = .white
            contentView.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
           
         }
         else {
            contentLabel.textColor = UIColor.white.withAlphaComponent(0.6)
            checkmark.tintColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
            contentView.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
         }
     }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      contentView.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)

    }
    
    
    func setupContent(with text: String, type: cellState)  {
        addSubview(contentLabel)
        addSubview(checkmark)
        
        if type == .select {
            checkmark.image = UIImage(systemName: "checkmark")
            contentLabel.textColor = UIColor.white
            checkmark.tintColor = UIColor.white
        } else {
            
            checkmark.image = UIImage(systemName: "checkmark")
            contentLabel.textColor = UIColor.white.withAlphaComponent(0.6)
            checkmark.tintColor = UIColor.lightGray.withAlphaComponent(0.08)
        }
       
        
        checkmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        checkmark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        checkmark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        checkmark.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        
        contentLabel.text = text
        contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
