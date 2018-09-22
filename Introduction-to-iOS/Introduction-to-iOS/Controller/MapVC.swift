//
//  MapVC.swift
//  Introduction-to-iOS
//
//  Created by Ivan OSYPENKO on 9/22/18.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
   
    @IBOutlet weak var mapView: MapManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mapView.showDeviceLocation()
        if let tabBar = tabBarController as? TabBarController {
            for key in tabBar.dataModel.pubs {
                mapView.addMark(place: key)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBar = tabBarController as? TabBarController {
            if !tabBar.showAll {
                mapView.clearMark()
            }
            
            if let i = tabBar.index {
                let place = tabBar.dataModel.pubs[i]
                tabBar.dataModel.pubs[i].show = true
                mapView.addMark(place: tabBar.dataModel.pubs[i])
                mapView.moveToLocation(with: place.coordinate)
                if place.title == "UNIT Factory" {
                    mapView.zoomToLatestLocation(with: place.coordinate, zoom: 100)
                }
            }
        }
    }
    
    //MARK: Actions
    
    @IBAction func moveToDeviceLocation(_ sender: Any) {
        mapView.moveToDeviceLocation()
    }
    
    @IBAction func showAll(_ sender: UIButton) {
         if let tabBar = tabBarController as? TabBarController {
            tabBar.showAll = true
            
            for key in tabBar.dataModel.pubs {
                mapView.addMark(place: key)
            }
            
            if let i = tabBar.index {
                mapView.moveToLocation(with: tabBar.dataModel.pubs[i].coordinate)
            }
        }
    }
    
    @IBAction func segmetedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.chaneMapType(mapeType: .standart)
        case 1:
            mapView.chaneMapType(mapeType: .satellite)
        case 2:
            mapView.chaneMapType(mapeType: .hybrid)
        default:
            break
        }
    }
}

