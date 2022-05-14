//
//  TestCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/14/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    private var urlString: String = ""
    
    func setCellWithValue(_ show: Show) {
        updateUI(posterShow: show.image?.original, titleShow: show.name, summaryShow: show.summary, ratingShow: show.rating?.average)
    }
    
    private func updateUI(posterShow: String?, titleShow: String?, summaryShow: String?, ratingShow: Double?) {
        self.tittle.text = titleShow
        if let rate = ratingShow {
            self.rating.text = String(rate)
        } else { self.rating.text = "-" }
        
        if let about = summaryShow {
            self.summary.text = about
        } else { self.summary.text = "" }
        
        guard let posterUrl = URL(string: posterShow!) else { return }
        self.poster.image = nil
        getImageFrom(url: posterUrl)
    }
    
    private func getImageFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("load image error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("empty image data")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.poster.image = image
                }
            }
        }.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
