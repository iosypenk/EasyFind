//
//  MapMark.swift
//  Introduction-to-iOS
//
//  Created by Maxym RYBAK on 22.09.2018.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import MapKit

final class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
}
