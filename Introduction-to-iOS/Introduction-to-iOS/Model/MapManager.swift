//
//  MapManager.swift
//  Introduction-to-iOS
//
//  Created by Maxym RYBAK on 22.09.2018.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import MapKit

enum MapTypes {
    case hybrid
    case standart
    case satellite
}

class MapManager: MKMapView {
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    var mapTypeToShow : MapTypes = .standart
    var mapMarks = [Annotation]()
    
    func showDeviceLocation() {
        self.mapType = .standard
        self.showsCompass = true
        self.showsScale = true

        configureLocationServices()
    }
    
    
    func addMark(place : Place) {
        
        self.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        let someAnnotation = Annotation(coordinate: place.coordinate, title: place.title, subtitle: place.subtitle)
        self.addAnnotation(someAnnotation)
        mapMarks.append(someAnnotation)
    }
    
    func clearMark() {
         self.removeAnnotations(mapMarks)
    }
    
    func moveToDeviceLocation() {
        if let coordinate = currentCoordinate {
             moveToLocation(with: coordinate)
        }
    }
    
    func moveToLocation (with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 2500, 2500)
        self.setRegion(zoomRegion, animated: true)
    }
    
    func chaneMapType(mapeType: MapTypes) {
        if mapeType == .satellite {
            self.mapType = .satellite
        } else if mapeType == .standart {
            self.mapType = .standard
        } else if mapeType == .hybrid {
            self.mapType = .hybrid
        }

    }
    
    private func configureLocationServices() {
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        self.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation (with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000)
        self.setRegion(zoomRegion, animated: true)
    }
    
    func zoomToLatestLocation (with coordinate: CLLocationCoordinate2D, zoom: CLLocationDistance) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, zoom, zoom)
        self.setRegion(zoomRegion, animated: true)
    }
}

extension MapManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension MapManager: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let schoolAnnotation = self.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            schoolAnnotation.animatesWhenAdded = true
            schoolAnnotation.titleVisibility = .adaptive
            
            return schoolAnnotation
        }
        return nil
    }
}

