//
//  CurrentLocationBtn.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/28.
//

import UIKit
import CoreLocation
import NMapsMap

class CurrentLocationBtn: UIButton, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var mapView: NMFMapView!
    
    func setMapView(_ mapView: NMFMapView) {
            self.mapView = mapView
        }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = self.layer.frame.width/2
        self.backgroundColor = .white
        self.setImage(UIImage(named: "location.png"), for: .normal)
        self.addTarget(self, action: #selector(self.locationInfor), for: .touchUpInside)
    }

    @objc func locationInfor(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        searchLocation()
    }
    
    func searchLocation(){
        let locationLatitude = locationManager.location?.coordinate.latitude
        let locationLogitude = locationManager.location?.coordinate.longitude
        
        /* camera */
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationLatitude ?? 0,
                                                               lng: locationLogitude ?? 0))
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
        
        /* currentPosition Marker */
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: locationLatitude ?? 0,
                                    lng: locationLogitude ?? 0)
        marker.iconImage = NMFOverlayImage(name: "marker.png")
        marker.captionText = "내 위치"
        marker.width = 24
        marker.height = 30
        marker.mapView = mapView
        
        /* informationWindow */
        let information = NMFInfoWindow()
        let dataSource = NMFInfoWindowDefaultTextSource.data()
        dataSource.title = "내 위치"
        information.dataSource = dataSource
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
