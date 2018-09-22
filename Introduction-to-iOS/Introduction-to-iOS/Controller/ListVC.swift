//
//  ListVC.swift
//  Introduction-to-iOS
//
//  Created by Ivan OSYPENKO on 9/22/18.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    //MARK: Rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tabbar = tabBarController as? TabBarController {
            return tabbar.dataModel.pubs.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListViewCell
        if let tabbar = tabBarController as? TabBarController {
            cell.initCell(place: tabbar.dataModel.pubs[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tabBar = tabBarController as? TabBarController {
            tabBar.index = indexPath.row
            tabBar.showAll = false
            
            let count: Int = Int(tabBar.dataModel.pubs.count)
            for index in 0..<count {
                tabBar.dataModel.pubs[index].show = false
            }
        }
        self.tabBarController?.selectedIndex = 0
    }
 

}

