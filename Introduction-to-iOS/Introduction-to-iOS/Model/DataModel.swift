//
//  DataModel.swift
//  Introduction-to-iOS
//
//  Created by Ivan OSYPENKO on 9/22/18.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import Foundation
import MapKit

struct Place {
    var title: String
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var show: Bool
}

class DataContainer {
    
    var pubs = [Place]()
    
    func initPlace(title: String, subtitle: String?, latitude: Double, longtitude: Double, show: Bool) {
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let newPlace = Place(title: title, subtitle: subtitle, coordinate: coordinate, show: show)
        self.pubs.append(newPlace)
    }
    

}
