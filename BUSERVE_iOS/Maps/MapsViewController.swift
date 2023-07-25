//
//  MapsViewController.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/24.
//

import UIKit
import NMapsMap
import CoreLocation

class MapsViewController: UIViewController, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    var mapView: NMFMapView!
    
    @IBOutlet weak var Btn: NMFLocationButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mapView = NMFMapView(frame: view.frame)
        mapView = NMFMapView(frame: view.frame)
        mapView.setLayerGroup(NMF_LAYER_GROUP_TRANSIT, isEnabled: true)
        mapView.allowsZooming = true
        mapView.allowsScrolling = true
        mapView.isIndoorMapEnabled = true
        
        Btn.backgroundColor = .clear
        Btn.mapView = mapView
        
        view.addSubview(mapView)
        view.addSubview(Btn)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 88).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        
        setLoactionManager()
        
    }
    
    func setLoactionManager(){
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled(){
                print("위치 서비스 on\n")
                self.locationManager.startUpdatingLocation()
            }else{
                print("위치 서비스 off\n")
            }
        }
    }
    
    /* MapControll */
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch locationManager.authorizationStatus{
        case .authorizedAlways, .authorizedWhenInUse:
            DispatchQueue.main.async {
                /* cameraMove */
                let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.5666102, lng: 126.9783881))
                cameraUpdate.animation = .easeIn
                self.mapView.moveCamera(cameraUpdate)
             
                /* currentPosition Marker */
                let marker = NMFMarker()
                marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
                marker.iconImage = NMFOverlayImage(name: "marker.png")
                marker.captionText = "내 위치"
                marker.width = 24
                marker.height = 30
              
                marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                    print("마커 터치")
                    return true // 이벤트 소비, -mapView:didTapMap:point 이벤트는 발생하지 않음
                }
                
                marker.mapView = self.mapView
             
                /* informationWindow */
                let information = NMFInfoWindow()
                let dataSource = NMFInfoWindowDefaultTextSource.data()
                dataSource.title = "내 위치"
                information.dataSource = dataSource
            }
        case .denied, .restricted:
            print("위치 서비스 권한 없음")
            locationDisable()
        case .notDetermined:
            print("위치 서비스 권한 없음")
        @unknown default:
            print("알 수 없는 상태")
        }
    }
    
    /* printLocationManager */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdate")
        if let location = locations.first{
            print("위도: \(location.coordinate.latitude)")
            print("경도: \(location.coordinate.longitude)")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    /* Alter */
    func locationDisable(){
        let alterController = UIAlertController(title: "위치 접근 권한이 필요합니다.", message: "이 기능을 사용하려면 '설정'에서 위치 접근 권한을 허용해주세요", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let checkAction = UIAlertAction(title: "설정으로 가기", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options:  [:], completionHandler: nil)
            }
        }
        alterController.addAction(cancelAction)
        alterController.addAction(checkAction)
        self.present(alterController, animated: true, completion: nil)
    }
}
