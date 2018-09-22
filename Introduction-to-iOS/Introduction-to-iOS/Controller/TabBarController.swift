//
//  TabBarController.swift
//  Introduction-to-iOS
//
//  Created by Ivan OSYPENKO on 9/22/18.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let dataModel = DataContainer()
    var index : Int?
    var showAll = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataModel.initPlace(title: "UNIT Factory", subtitle: "Kicker table playground", latitude: 50.468994, longtitude: 30.462168, show: true)
        self.dataModel.initPlace(title: "Porter Pub", subtitle: nil, latitude: 50.469869, longtitude: 30.459556, show: true)
        self.dataModel.initPlace(title: "Playpub", subtitle: nil, latitude: 50.462839, longtitude: 30.466705, show: true)
        self.dataModel.initPlace(title: "VDosku", subtitle: nil, latitude: 50.468976, longtitude: 30.469646, show: true)
        self.dataModel.initPlace(title: "This is Пивбар", subtitle: nil, latitude: 50.440702, longtitude: 30.523785, show: true)
        self.dataModel.initPlace(title: "Sherlock Pub", subtitle: nil, latitude: 50.447289, longtitude: 30.450464, show: true)
        self.dataModel.initPlace(title: "Barduck", subtitle: nil, latitude: 50.440199, longtitude: 30.508395, show: true)
        self.dataModel.initPlace(title: "Mad dog in the Fog", subtitle: nil, latitude: 37.772952, longtitude: -122.428145, show: true)
        self.dataModel.initPlace(title: "The Pub", subtitle: nil, latitude: 37.807085, longtitude: -122.420674, show: true)
        self.dataModel.initPlace(title: "The Irish Bank", subtitle: nil, latitude: 37.794388, longtitude: -122.400929, show: true)
    }

}

