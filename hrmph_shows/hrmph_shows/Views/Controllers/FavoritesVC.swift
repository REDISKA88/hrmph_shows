//
//  FavoritesVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class UserModal {
   var userImage: UIImage?
   var name: String?
   var age: String?
     
   init(userImage: UIImage, name: String, age: String) {
       self.userImage = userImage
       self.name = name
       self.age = age
   }
}

class FavoritesVC: MainTheme {
    var userArr = [UserModal]()
    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
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
        userArr.append(UserModal(userImage: UIImage(named: "a4")!, name: "name", age: "21"))
        userArr.append(UserModal(userImage: UIImage(named: "b3")!, name: "tableView", age: "23"))
        userArr.append(UserModal(userImage: UIImage(named: "b4")!, name: "append", age: "15"))
        userArr.append(UserModal(userImage: UIImage(named: "b5")!, name: "UserModal", age: "15"))
        userArr.append(UserModal(userImage: UIImage(named: "b6")!, name: "userImage", age: "18"))
        userArr.append(UserModal(userImage: UIImage(named: "b7")!, name: "self", age: "22"))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}
extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
     
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return userArr.count
     }
     
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//       cell.userImage.image = userArr[indexPath.row].userImage
//    cell.userImage.contentMode = .scaleAspectFit
//       cell.namelbl.text = userArr[indexPath.row].name
    
//       cell.agelbl.text = userArr[indexPath.row].age
    
    
    
       return cell
     }
     
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
     }
}
