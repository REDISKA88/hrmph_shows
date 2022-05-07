//
//  FavoritesVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit


class FavoritesVC: MainTheme {
    var tableView = UITableView()
    
    var allImages = ["8", "9", "10","11","12","13","14","15", "16", "17","18","19","20","21","22","23","24","25","26","27","28"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        allImages.shuffle()
    }
    
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.frame = self.view.frame
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.layer.cornerRadius = 30
        header.backgroundColor = .clear
        //header.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.5)
        let favoritesImage = UIImageView()
        header.addSubview(favoritesImage)
        favoritesImage.image = UIImage(named: "fs2")
        favoritesImage.contentMode = .scaleAspectFit
        favoritesImage.translatesAutoresizingMaskIntoConstraints = false
        favoritesImage.topAnchor.constraint(equalTo: header.topAnchor, constant: 0).isActive = true
        favoritesImage.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 0).isActive = true
        favoritesImage.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 0).isActive = true
        favoritesImage.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 0).isActive = true
    
        
        tableView.tableHeaderView = header
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}
extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
     
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allImages.count
     }
     
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
    let image = UIImage(named: allImages[indexPath.row])
    cell.show.image = image
    
    
    return cell
    }
     
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
     }
}
